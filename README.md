
# XOXO Gossip Girl

This project takes a database of gossips and stocks them on a website. They are accessed once the user puts in their name on the landing page. You can create a gossip via the index page, after inputing your name. 


## Authors

- [@katamaric](https://www.github.com/katamaric)
- [@artem-ine](https://www.github.com/artem-ine)


## Run Locally

Assuming you have postgres installed (if not, figure that out)!

Do a standard bundle install

```bash
  bundle install
```

Initialize the migrations (if necessary, create a database first with rails db:create)

```bash
  rails db:migrate
```

Run the seed file to fill in the databse

```bash
  rails db:seed
```

Start the server. 

```bash
  rails server
```

You should be able to access it via your standard friendly http://localhost:3000/. Go apeshit!
