# The Last Station

This is a choose-your-own adventure game I began writing for National Novel Writing Month 2014 designed to run on [StoryNexus](www.storynexus.com) which was completed before I realised that StoryNexus was no longer actively supported, so I ended up writing my own game engine to achieve a similar experience but with greater flexibility.

## Getting Started

At the moment, this app is only able to run on your local machine but I will eventually get it to the point where it can be distributed and used (at your own risk!). 

Currently in order to create your own story, you need to use the backend story admin interface under localhost:3000/stories/ where you can add "stories" which link up to one another to create a narrative, and "qualities" which describe the character's progression, status, and inventory.  

The intro sequence (character creation and beginning narrative steps) are hard-coded in various html views under "thelaststation\app\views\characters"

### Prerequisites
Ruby version 2.4.0
Ruby on Rails version 4.2.8

### Installing
A guide to installing Ruby on Rails can be found [here](https://www.tutorialspoint.com/ruby-on-rails/rails-installation.htm).

After installing, forking the repository, you should be able to successfully run the rails server and see the starting page for a player. 

## Deployment

Not available yet!

## Authors

* **Juliana Zhu** - [Riadre](https://github.com/riadre)

## License

This project is licensed under the [The Non-Profit Open Software License version 3.0 (NPOSL-3.0)](https://opensource.org/licenses/NPOSL-3.0)

## Acknowledgments

* *Justin Lambert* - for the code reviews and the support.
* *StoryNexus* - for the inspiration.
