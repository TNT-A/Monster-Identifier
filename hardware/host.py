import socket
from gpiozero import Button
from signal import pause as run
import subprocess

# Server configuration
HOST = '0.0.0.0'  # Listen on all interfaces
PORT = 50007  # Arbitrary non-privileged port

ip_output = subprocess.check_output(['hostname', '-I']).decode().strip()
print(f"Device IP addresses: {ip_output}") # Display the IP addresses of the device

# Set up TCP socket server
server_socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
server_socket.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)
server_socket.bind((HOST, PORT))
server_socket.listen(1)
print(f"Waiting for a client to connect on port {PORT}...")
conn, addr = server_socket.accept()
print(f"Connected by {addr}")


def button1_pressed():
    print("Button 1 pressed!")
    try:
        conn.sendall(b'button1_pressed')
    except Exception as e:
        print(f"Error sending button1: {e}")

def button2_pressed():
    print("Button 2 pressed!")
    try:
        conn.sendall(b'button2_pressed')
    except Exception as e:
        print(f"Error sending button2: {e}")



def button1_released():
    print("Button 1 released!")
    try:
        conn.sendall(b'button1_released')
    except Exception as e:
        print(f"Error sending button1_released: {e}")

def button2_released():
    print("Button 2 released!")
    try:
        conn.sendall(b'button2_released')
    except Exception as e:
        print(f"Error sending button2_released: {e}")


# buttons are connected to GPIO pins 17 and 27
button_1 = Button(17)
button_2 = Button(27)

# Set up button event handlers
button_1.when_pressed = button1_pressed
button_2.when_pressed = button2_pressed

button_1.when_released = button1_released
button_2.when_released = button2_released


print("Waiting for button presses...")
try:
    run()
except KeyboardInterrupt:
    print("Exiting program.")
finally:
    conn.close()
    server_socket.close()
