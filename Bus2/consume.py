import requests

stopList = [
	'Hiland Park',
	'Ajaynagar',
	'Mukundupur',
	'Kalikapur',
	'Ruby',
	'VIP Bazar',
	'Panchanno Gram',
	'Science City',
	'Dhapa',
	'Metropolitan',
	'Chingrighata',
	'Nicco Park',
	'Wipro/Swasthya Bhawan',
	'College More/SDF',
	'Philps More',
	'Technopolis',
	'Newtown',
	'Pride Plaza',
	'Biswa Bangla/NarkelBagan',
	'EcoSpace',
	'UEM/Karigori Bhawan',
	'Shapoorji'
]

'''for i in stopList:
	payload = {'name' : i}
	response = requests.post('http://127.0.0.1:8000/api/stop/add', data=payload)
	print(response.json())
'''
for i,stop in enumerate(stopList):
	payload = {
        "prev_stop_time": "00:02:30",
        "next_stop_time": "00:02:30",
        "sequence": i+10,
        "bus": "C48",
        "stoppage": stop
    }
	response = requests.post('http://127.0.0.1:8000/api/route/add', data=payload)
	print(response.json())

'''response = requests.get('http://127.0.0.1:8000/api/bus')
print(response.json())'''