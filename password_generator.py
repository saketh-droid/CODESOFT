import customtkinter
from tkinter import messagebox
from tkinter import *
import string
import random

app = customtkinter.CTk()
app.title('Password Generator')
app.geometry("350x550")
app.config(bg='#09112e')

font1 = ('Arial', 30, 'bold')
font2 = ('Arial', 18, 'bold')
font3 = ('Arial', 18, 'bold')


def clear_passwords():
    if pwd_list.size() != 0:
        pwd_list.delete(0, END)
    else:
        messagebox.showerror('Error', 'No passwords were generated.')


def add_pwd(pwd):
    if pwd:
        pwd_list.insert(0, pwd)
    else:
        messagebox.showerror("error", 'Enter a task.')


def generate_password():
    password_length = int(pwd_length.get())
    if password_length < 4:
        messagebox.showerror("Error", "Password length must be at least 4 characters.")
        return
    characters = string.ascii_letters + string.digits + string.punctuation
    password = ''.join(random.choice(characters) for _ in range(password_length))
    add_pwd(password)


title_label = customtkinter.CTkLabel(app, font=font1, text="Password Generator", text_color='#fff', bg_color='#09112e')
title_label.place(x=20, y=20)

length_label = customtkinter.CTkLabel(app, font=font2, text="Enter password length: ", text_color='#fff', bg_color='#09112e')
length_label.place(x=20, y=70)

pwd_length = customtkinter.CTkEntry(app, font=font3, text_color='#000', fg_color='#fff', border_color='#fff', width=310)
pwd_length.place(x=20, y=110)

Generate_button = customtkinter.CTkButton(app, command=generate_password, font=font2, text_color='#fff', text='Generate password', fg_color='#06911f', hover_color='#06911f', bg_color='#09112e', cursor='hand2', corner_radius=5, width=200)
Generate_button.place(x=75, y=150)

result_label = customtkinter.CTkLabel(app, text="Generated Password: ", font=font2, text_color='#fff', bg_color='#09112e')
result_label.place(x=40, y=200)

pwd_list = Listbox(app, width=35, height=10, font=font3)
pwd_list.place(x=30, y=300)

clear_list_button = customtkinter.CTkButton(app, command=clear_passwords, font=font2, text_color='#fff', text='clear passwords', fg_color='#06911f', hover_color='red', bg_color='#09112e', cursor='hand2', corner_radius=5, width=160)
clear_list_button.place(x=160, y=370)

length_label = customtkinter.CTkLabel(app, font=font2, text="Note: You can select any of the \nabove passwords", text_color='#fff', bg_color='#09112e')
length_label.place(x=20, y=420)


app.mainloop()
