## Analysis

The first thing was to analice `Conekta` and how it works. After reading the documentation
and some investigation, I saw that Conekta give you a roboust integration with payments, but
also provide a simple way as the excersice asks: create a payment link.

With that in mind, I started to play around and Conekta API interface, creating payment links
and when I was going to pay, I realized that on development mode you will be able to "pay"
with any method without any issue.

So, what do I need to start coding? Well after install `ngrok` I was ready to create my `webhook`,
but some issues appear, apparently the key that was provided to me reached the maximun amount of
webhooks, prohibiting me from creating a new one. I realized that some of them were to old, so
I deleted one of them (I was worry about that other deve were using it)

### Start Coding

So I realized I needed some classes
  - Products: Nothing special, just the product with the name and price
  - Payment: Here is where I'm going to store the payment url and the id from Conekta
  - Order: The order of the client, in here I'm going to store all the data Conekta needs
  to create a payment, like name of the client, phone etc
  - Line Item: This is the object that joins the products and the order. One order could
  have several line items, and one line item just have one product. But the line item store
  also the quantity and the price of the product in at the moment was added to the order, so
  if the price change we're not going to change the total amount of the order after created,
  and we can know how much pay the user in that moment for the products

### API

Ok, now I need to connect with Conekta to create the payment url, for this I'm going to create a
client to encapsulate the configuration and service to provide the endpoints

### Webhook

For the webhooks, I'm going to use a `job`, so the moment I receive a message, I'm going to
create a job to do the task async, and reply right after that, so there is no delay.
This is a good practice because IDK how much request I'm going to recive.
For production uses, I'm going to add `Sidekiq` with `Redis` so we can monitor our jobs
