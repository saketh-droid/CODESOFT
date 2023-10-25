import customtkinter
from tkinter import messagebox
from tkinter import *

app = customtkinter.CTk()
app.title('Contact Book')
app.geometry("500x600")
app.config(bg='#09112e')

font1 = ('Arial', 30, 'bold')
font2 = ('Arial', 18, 'bold')
font3 = ('Arial', 14)

contacts = []


def add_contact():
    name = name_entry.get()
    phone = phone_entry.get()
    email = email_entry.get()
    address = address_entry.get()

    if name and phone:
        contacts.append({'name': name, 'phone': phone, 'email': email, 'address': address})
        messagebox.showinfo("Success", "Contact added successfully.")
        clear_fields()
        display_contacts()
    else:
        messagebox.showerror("Error", "Name and phone number are required.")


def display_contacts():
    contact_list.delete(0, END)
    for contact in contacts:
        contact_list.insert(END, f"{contact['name']} - {contact['phone']}")


def search_contact():
    search_term = search_entry.get()
    contact_list.delete(0, END)
    for contact in contacts:
        if search_term.lower() in contact['name'].lower() or search_term in contact['phone']:
            contact_list.insert(END, f"{contact['name']} - {contact['phone']}")


def update_contact():
    selected = contact_list.get(contact_list.curselection())
    if not selected:
        return

    selected_name, selected_phone = selected.split(' - ')
    name = name_entry.get()
    phone = phone_entry.get()
    email = email_entry.get()
    address = address_entry.get()

    for contact in contacts:
        if contact['name'] == selected_name and contact['phone'] == selected_phone:
            contact['name'] = name
            contact['phone'] = phone
            contact['email'] = email
            contact['address'] = address
            break

    clear_fields()
    display_contacts()
    messagebox.showinfo("Success", "Contact updated successfully.")


def delete_contact():
    selected = contact_list.curselection()
    if not selected:
        messagebox.showerror('Error', 'Select contact to delete')
    else:
        selected_name, selected_phone = contact_list.get(selected[0]).split(' - ')
        for contact in contacts:
            if contact['name'] == selected_name and contact['phone'] == selected_phone:
                contacts.remove(contact)
                break

        clear_fields()
        display_contacts()
        messagebox.showinfo("Success", "Contact deleted successfully.")


def clear_fields():
    name_entry.delete(0, END)
    phone_entry.delete(0, END)
    email_entry.delete(0, END)
    address_entry.delete(0, END)


name_label = customtkinter.CTkLabel(app, text="Name:", font=font2, text_color='#fff', bg_color='#09112e')
name_label.place(x=20, y=20)

name_entry = customtkinter.CTkEntry(app, font=font3, text_color='#000', fg_color='#fff', border_color='#fff', width=240)
name_entry.place(x=150, y=20)

phone_label = customtkinter.CTkLabel(app, text="Phone:", font=font2, text_color='#fff', bg_color='#09112e')
phone_label.place(x=20, y=70)

phone_entry = customtkinter.CTkEntry(app, font=font3, text_color='#000', fg_color='#fff', border_color='#fff',
                                     width=240)
phone_entry.place(x=150, y=70)

email_label = customtkinter.CTkLabel(app, text="Email:", font=font2, text_color='#fff', bg_color='#09112e')
email_label.place(x=20, y=120)

email_entry = customtkinter.CTkEntry(app, font=font3, text_color='#000', fg_color='#fff', border_color='#fff',
                                     width=240)
email_entry.place(x=150, y=120)

address_label = customtkinter.CTkLabel(app, text="Address:", font=font2, text_color='#fff', bg_color='#09112e')
address_label.place(x=20, y=170)

address_entry = customtkinter.CTkEntry(app, font=font3, text_color='#000', fg_color='#fff', border_color='#fff',
                                       width=240)
address_entry.place(x=150, y=170)

add_button = customtkinter.CTkButton(app, text="Add Contact", command=add_contact, font=font2, text_color='#fff',
                                     fg_color='#06911f', hover_color='#06911f', bg_color='#09112e', cursor='hand2',
                                     corner_radius=5, width=15)
add_button.place(x=20, y=220)

update_button = customtkinter.CTkButton(app, text="Update Contact", command=update_contact, font=font2,
                                        text_color='#fff', fg_color='#06911f', hover_color='#06911f',
                                        bg_color='#09112e', cursor='hand2', corner_radius=5, width=20)
update_button.place(x=180, y=220)

delete_button = customtkinter.CTkButton(app, text="Delete Contact", command=delete_contact, font=font2,
                                        text_color='#fff', fg_color='#FF0000', hover_color='#FF0000',
                                        bg_color='#09112e', cursor='hand2', corner_radius=5, width=20)
delete_button.place(x=350, y=220)

clear_button = customtkinter.CTkButton(app, text="Clear Fields", command=clear_fields, font=font2, text_color='#fff',
                                       fg_color='#FFA500', hover_color='#FFA500', bg_color='#09112e', cursor='hand2',
                                       corner_radius=5, width=15)
clear_button.place(x=20, y=270)

search_entry = customtkinter.CTkEntry(app, font=font3, text_color='white', fg_color='black', border_color='#fff',
                                      width=146)
search_entry.place(x=350, y=350)

search_button = customtkinter.CTkButton(app, text="Search Contact", command=search_contact, font=font2,
                                        text_color='#fff', fg_color='#06911f', hover_color='#06911f',
                                        bg_color='#09112e', cursor='hand2', corner_radius=5, width=20)
search_button.place(x=350, y=320)

contact_list = Listbox(app, width=41, height=10, font=font3)
contact_list.place(x=30, y=400)

display_contacts()

app.mainloop()
