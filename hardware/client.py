import socket
import pyautogui

# keys 
BUTTON1_KEY = 'a'
BUTTON2_KEY = 'd'

# Set this to the server's IP address
SERVER_IP = pyautogui.prompt(text='enter the host IPv4 address:', title='host address' , default='')
PORT = 50007

with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as s:
    s.connect((SERVER_IP, PORT))
    print(f"Connected to server at {SERVER_IP}:{PORT}")
    while True:
        data = s.recv(1024)
        if not data:
            break

        # Decode the received bytes to string
        msg = data.decode('utf-8')
        print(f"Received: {msg}")

        # Perform actions based on the received message
        if msg == 'button1_pressed':
            pyautogui.keyDown(BUTTON1_KEY)
        elif msg == 'button2_pressed':
            pyautogui.keyDown(BUTTON2_KEY)
        
        elif msg == 'button1_released':
            pyautogui.keyUp(BUTTON1_KEY)
        elif msg == 'button2_released':
            pyautogui.keyUp(BUTTON2_KEY)
