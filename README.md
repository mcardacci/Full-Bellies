# FullBellies

FullBellies is an application that connects restuaurants and grocers directly with customers, allowing vendors to sell leftover and soon to be expired foods that might otherwise be thrown out and accounted for as a loss.  This application was built with the intention of cutting down on overall food waste, while also making affordable meals more accessaible.

##Members
#### [Lowell Mower](https://github.com/lowellmower)
#### [Marc Cardacci](https://github.com/mcardacci)
#### [Ross Wilson](https://github.com/grapefruitricky)
#### [John Lyden](https://github.com/johnlyden)

##Resources
[Heroku Deployment](https://afternoon-meadow-3523.herokuapp.com/)

[Trello Board](https://trello.com/b/KCCdiimC/full-bellies)

[Slack Channel](https://fullbellies.slack.com/messages)

## Installation

```sh
$ git clone [git-repo-url]
$ cd /full-bellies
$ bundle
$ rake db:create
$ rake db:migrate
$ rake db:seed
$ rails s
```
##Technologies
FullBellies uses a number of open source projects to work properly:
* [Bcrypt] - password hashing algorithm, store a secure hash of your users' passwords.
* [Stripe] - allows both private individuals and businesses to accept payments over the Internet
* [Twilio] - programmatically make and receive phone calls and send and receive text messages
* [Sendgrid] - transactional and marketing email through one reliable platform
* [Paperclip] - easy file attachment library for Active Record
* [Twitter Bootstrap] - great UI boilerplate for modern web apps
* [jQuery] - duh

### Version
1.0.0

### Tech

Dillinger uses a number of open source projects to work properly:

### Development

Want to contribute? Great! Feel free to create an issue or open a pull request!

[Twitter Bootstrap]:http://twitter.github.com/bootstrap/
[jQuery]:http://jquery.com
[Paperclip]:https://sendgrid.com/
[Sendgrid]:https://github.com/sendgrid
[Twilio]:https://www.twilio.com/
[Stripe]:https://stripe.com/
[BCrypt]:https://github.com/codahale/bcrypt-ruby
