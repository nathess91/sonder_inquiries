# Sonder Booking Quote Project

This is a Ruby on Rails mini app designed to keep track of inquiries made by phone and email. Sonder customer support team members can log the booking using the "New Inquiry" form.

This mini app also contains logic that calculates the average price per night for each unit and the total price and taxes withheld for each inquiry.

### Requirements (taken from original prompt)

- The reservation requests should be called inquiries.
- An inquiry should have a rental site.
- The inquiry should have a unit.
- The user should be able to select the unit by the ad name.
- The inquiry should have a price, which is the sum of all _nights_ that the guest stayed in the room. So a stay from May 1st to May 3rd would have two nights.
- The inquiry should store the amount of taxes that were withheld, when the inquiry was made.

### Assumptions

- Since this is an internal tool, for this quick implementation, I chose to not include a User model. However, if this were a real internal tool, there should be auth set up.
- I added additional columns to the Inquiry model that were not explicitly mentioned in the requirements that I thought were important for logging an inquiry and making calculations: `first_name`, `last_name`, `phone_number`, `email`, `arrival_date`, and `departure_date`.

### Installation

1. Clone this repo and `cd` into it
2. `bundle install`
3. `rails db:setup`

## Schema

I set up my Inquiry model to establish appropriate relationships with the preexisting DayPrice and Unit models. A Unit has many `day_prices` and `inquiries`, therefore, my Inquiry model requires the `unit_id` as a foreign key.

<img src="http://i.imgur.com/XwNLplp.png" width="600">

## Features

To maintain consistency and honor the existing design on Sonder's website, I did my best to emulate their design patterns.

### Units Index
<img src="http://i.imgur.com/JoBKNAP.png" width="600">

### New Inquiry Form
<img src="http://i.imgur.com/9tb5HKl.png" width="600">

### Flash Messages and Validations
When a new inquiry is created successfully.
<img src="http://i.imgur.com/QvGH98Z.png" width="600">


The Inquiry model contains data validations that will show up as an error message if a user fails to input an arrival date, for an example.

<img src="http://i.imgur.com/U7YCGcG.png" width="600">

### Unit Page
<img src="http://i.imgur.com/V82aWDt.png" width="600">

## Personal Challenges

Aside from Imgur crashing, it was fairly tricky to get the logic down for the `calculate_total_price` Inquiry method. It would have been much easier if I had just used the value returned by the `get_avg_price` method, but the total price would not be truly accurate. If the customer booked their trip on dates found within the unit's `day_prices`, the price should be that specific value in `day_prices`. However, if the customer's trip dates were not found within `day_prices`, we'd then go with the value returned by `get_avg_price`.

## Future Additions

Some ideas to keep in mind for subsequent iterations:

- Add ReactJS
- Add search (with autocomplete) and filter functionality to make looking up information simple and fast
- Creating a dashboard with analytics so it's easier to get the "big picture", such as which units have the most inquiries
