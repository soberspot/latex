import PySimpleGUI as sg

# Very basic window.  Return values as a list

layout = [      
          [sg.Text('Данные по событию')],      
          [sg.Text('Name', size=(15, 1)), sg.InputText('name')],   
          [sg.Text('Name', size=(15, 1)), sg.InputText('name')],   
          [sg.Text('Address', size=(15, 1)), sg.InputText('address')],      
          [sg.Text('Phone', size=(15, 1)), sg.InputText('phone')],      
          [sg.Text('ТС', size=(15, 1)), sg.InputText('тс')],
          [sg.Text('VIN', size=(15, 1)), sg.InputText('vin')],
          [sg.Submit(), sg.Cancel()]      
         ]

window = sg.Window('Simple data entry window').Layout(layout)         
button, values = window.Read()

print(button, values[0], values[1], values[2], values[3], values[4])
