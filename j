# defining window size
window = Tk()
window.geometry('500x500')
window.title("Crypto Exchange Rate Calculator")
window.configure(background = "bisque")

# creating label and entry widget
lbl = Label(window, text = "BTC:", font = ("Arial Bold", 15), bg = "bisque")
lbl.grid(column = 0, row = 0)
e1 = Entry(window)
e1.grid(column = 1, row = 0)

lbl2 = Label(window, text = "ETH:", font = ("Arial Bold", 15), bg = "bisque")
lbl2.grid(column = 0, row = 1)
e2 = Entry(window)
e2.grid(column = 1, row = 1)

lbl3 = Label(window, text = "BNB:", font = ("Arial Bold", 15), bg = "bisque")
lbl3.grid(column = 0, row = 2)
e3 = Entry(window)
e3.grid(column = 1, row = 2)

lbl4 = Label(window, text = "XRP:", font = ("Arial Bold", 15), bg = "bisque")
lbl4.grid(column = 0, row = 3)
e4 = Entry(window)
e4.grid(column = 1, row = 3)

#convert button
convert = Button(window, text = "Convert currency", bg = "pale green", fg = "black")
convert.grid(column = 1, row = 4)

#close button
close = Button(window, text = "Close converter", bg = "dark orange", fg = "black")
close.grid(column = 1, row = 5)

def close_window():
    window.destroy()
    exit()


def convert_button():

    Date_Time = datetime.today().strftime("%m/%d/%Y")

    BTC_answer = float(e1.get())

    ETH_answer = float(e2.get())

    BNB_answer = float(e3.get())

    XRP_answer = float(e4.get())

    r = requests.get(url)

    BTC_rate = r.json()['bpi']['USD']['rate_float']

    ETH_rate = r.json()['bpi']['ETH']['rate_float']

    BNB_rate = r.json()['bpi']['BNB']['rate_float']

    XRP_rate = r.json()['bpi']['XRP']['rate_float']

    BTC_answer_rate = BTC_answer * BTC_rate

    ETH_answer_rate = ETH_answer * ETH_rate

    BNB_answer_rate = BNB_answer * BNB_rate

    XRP_answer_rate = XRP_answer * XRP_rate

    print("BTC: ", BTC_answer_rate)

    print("ETH: ", ETH_answer_rate)

    print("BNB: ", BNB_answer_rate)

    print("XRP: ", XRP_answer_rate)

    with open('crypto_conversions.csv', 'a') as new_file:
        new_file.write(str(Date_Time) + ',' + str(BTC_answer_rate) + ',' + str(ETH_answer_rate) + ',' + str(BNB_answer_rate) + ',' + str(XRP_answer_rate) + '\n')

    messagebox.showinfo("Conversion Complete", "Your conversion has been completed and saved to crypto_conversions.csv")

convert.configure(command = convert_button)
close.configure(command = close_window)
window.mainloop()

