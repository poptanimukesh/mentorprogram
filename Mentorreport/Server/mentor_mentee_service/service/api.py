from django.http import HttpResponse
import json
from .models import ActivityList, ActivitySummary
from datetime import datetime



from django.views.decorators.csrf import csrf_exempt

@csrf_exempt
def index(request):
	if request.method == 'GET':
		print(request)
		return HttpResponse("GET")
	elif request.method == 'POST':
		body_unicode = request.body.decode('utf-8')
		idx = 1
		response = json.loads(body_unicode)
		while 'activity'+str(idx) in response:
			k = 0
			if response['kept1'] == 'kept':
				k = 1
			aSummary = ActivitySummary(mentor_id=1, mentee_id=1, submission_date=datetime.now(), callattended=1)
			aSummary.save()
			aList = ActivityList(activity_id=aSummary.activity_id, activity_type=response['activity1'], iskept=k
				, duration=response['duration1'], comments=response['comments1'])
			aList.save()
			idx = idx + 1
			print(aList.activity_id)
		return HttpResponse("SUCCESS")