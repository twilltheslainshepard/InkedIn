#A/B Testing

A/B Test Name: Instant Booking vs Multi Step Booking
User Story Number: US4: Golden Path
Metrics: Task success and tracking the completion of booking, Engagement with the number of users who attempt to start/complete a booking, and retention (the frequency of return bookings) for each method.
Hypothesis: Users would much rather use a streamlined booking process that enables them to book an artist immediately with the click of a button. With simplicity there will be an increase in booking completion rates and it will reduce drop offs.
	-Problem: Some users drop off during the multi-booking process which includes having 
to select a time, select a date, view when the artist is available, and confirm the details. This removes the spontaneity of the user experience.
Experiment - Using firebase remote config, the user base will be divided into 2 groups. Group A, being 50% of users, will experience the current multi-booking process. Group B, being 50% of the other users, will simply click the book now button and the first available time slot is automatically assigned to them followed by a quick confirmation step. 
Variations - 
Multi-Step process, the current booking process, consists of various steps, view the artists availability, choosing a date, choosing a time slot, and confirming the details/date
One-click instant booking, uses a single button to instantly book the next available slot, clicking book now, confirming the details/date
	-Design note: variation b’s confirmation screen will allow users to edit anything accept or 
decline the current offer and edit anything if necessary

