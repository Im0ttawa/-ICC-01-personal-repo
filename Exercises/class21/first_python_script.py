#!/usr/bin/python

#Function to show the names in the file
def file_read():
     file = open("names.txt", "r")
     print("")
     print(file.read())

#Function to add names to the file
def add_name():
        name = input("Insert a name: ")
        file = open("names.txt","a")
        file.write(name + "\n")
        file.close
        print("\n" + name + " was added to the file!")

#While loop for menu
while True:
    print("==========================")
    print("1) Read and display names ")
    print("2) Add new name")
    print("3) Exit")
    print("==========================" + "\n")
    user_input = input("Choose a option: ")

    if user_input == "1":
     file_read()

    elif user_input == "2":
     add_name()

    else:
     print('Exiting...')         #Exit, need to add user stupefy
     break


