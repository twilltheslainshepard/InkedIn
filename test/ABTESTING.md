# A/B Testing

**A/B Test Name:** Instant Booking vs Multi Step Booking

**User Story Number:** US4: Golden Path

**Metrics:** Task success and tracking the completion of booking, Engagement with the number of users who attempt to start/complete a booking, and retention (the frequency of return bookings) for each method.

**Hypothesis:** Users would much rather use a streamlined booking process that enables them to book an artist immediately with the click of a button. With simplicity there will be an increase in booking completion rates and it will reduce drop offs.
	-Problem: Some users drop off during the multi-booking process which includes having 
to select a time, select a date, view when the artist is available, and confirm the details. This removes the spontaneity of the user experience.

**Experiment:** Using firebase remote config, the user base will be divided into 2 groups. Group A, being 50% of users, will experience the current multi-booking process. Group B, being 50% of the other users, will simply click the book now button and the first available time slot is automatically assigned to them followed by a quick confirmation step. 

**Variations:**
Multi-Step process, the current booking process, consists of various steps, view the artists availability, choosing a date, choosing a time slot, and confirming the details/date
One-click instant booking, uses a single button to instantly book the next available slot, clicking book now, confirming the details/date
	-Design note: variation b’s confirmation screen will allow users to edit anything accept or 
decline the current offer and edit anything if necessary

--------------------------------------------------------------------------------

**A/B Test Name:** Share Tattoo To External Social Media

**User Story Number:** US4: Golden Path

**Metrics:** Adoption: Attempts to bring new users in using different of sharing 

**Hypothesis:**  By allowing users to share tattoos from the platform directly to people on different social media platforms/messager, it incentivizes people to download the app to look into the shared media. It also acts as advertising because it’s directly tied to our platform, thus bringing new users in.
	-Problem: Users might not bother downloading the app if it has no barriers, but might also just get annoyed if the experience is too limiting. Additionally, the share 	button has to be easy to use and connect to other platforms.

**Experiment** - 30% of users will have a share button, while 70% will not. We’ll use firebase analytics to track the following metrics:
1.Number of shares made per user.
2.Number of clicks from shared links leading to app installs.
3.Conversion rate from shared links (installations leading to sign-ups or bookings).	4.User engagement post-sharing (how many users from the Test Group continue exploring the app).

**Variations** - Different locations of button, (near save button or near bottom), different levels of ease in actually sharing (one click to share, or a few menus), how much is actually shared (just a link to the photo, or a image with blurb?), how much info the friend/shared to user can see without an account (some, all, just a thumbnail ).


--------------------------------------------------------------------------------

**A/B Test Name:** Experience survey - short vs long version

**User Story Number:** US6: Post appointment feedback

**Metrics:** User review, Happiness

**Hypothesis:** A shorter post tattoo experience survey will increase completion rates without negatively affecting the quality of the feedback, leading to more users providing feedback.
	- Problem: Long surveys may discourage users from completing them, resulting in lower feedback volume and skewed data. We 		want to balance between quality and quantity of feedback.

**Experiment** - 50% of users will receive a short version of the survey with 3 key questions in the form of a yes or no button response, while the other 50% will receive the same 3 key questions but the answer will be in free-response form longer version. We’ll track survey completion rates and average ratings in google analytics.

**Variations** 
a) Long version: 3 free response questions
b) Short version: 3 questions (yes or no)

--------------------------------------------------------------------------------

**A/B Test Name:** Post-Pop up dimensions

**User Story Number:**  US4: Golden Path

**Metrics:** Task success 

**Hypothesis:** We want users to feel like they have freedom of navigation and don’t feel restrained by the UI. Users should feel like they can do whatever they desire when navigating forwards and backwards through our golden path. With a whole new screen everytime you click a tattoo design, it may feel too forced because the user may want only a preview. A solution could be to make the page more of a pop-up style that doesn’t cover the entire screen. This would still show the explore page behind the pop-up and allow for easy back navigation. 

**Experiment**  We will give only 20% of users the fullscreen tattoo page, while the rest will see the normal pop-up style. This way we are not negatively affecting the user base. Hopefully this will confirm the hypothesis that a whole new page for the tattoo designs is too clunky, and that a small pop-up is more user friendly. 


**Variations** 
Small vs large pop-up
Rounded corners
Back navigation by tapping outside the pop-up


