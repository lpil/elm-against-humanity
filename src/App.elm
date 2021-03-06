import Html exposing (..)
import Html.Attributes exposing (class)
import Html.Events exposing (onClick)
import Html.App
import Random.Array
import Random
import Array

main =
  Html.App.program
    { init = init
    , subscriptions = subscriptions
    , update = update
    , view = view
    }


-- Model

type Question
  = CheekyQuestion String
  | StraightQuestion String

type Answer
  = CheekyAnswer String
  | StraightAnswer String

type alias Model =
  { question : Question
  , answer : Answer
  }

init : (Model, Cmd Msg)
init =
  ( { question = CheekyQuestion "The orgy was brought to a grinding halt by ____"
    , answer = StraightAnswer "Entity too large errors"
    }
  , Cmd.none
  )

-- Subscriptions

subscriptions model =
  Sub.none


-- Update

type Msg
  = DrawQuestion
  | GotQuestion (Maybe Question)
  | GotAnswer (Maybe Answer)

update : Msg -> Model -> (Model, Cmd Msg)
update action model =
  case action of
    DrawQuestion ->
      (model, Random.generate GotQuestion randomQuestion)

    GotQuestion Nothing ->
      ( model
      , Random.generate GotQuestion randomQuestion
      )

    GotQuestion (Just (StraightQuestion question)) ->
      ( { model | question = StraightQuestion question }
      , Random.generate GotAnswer randomCheekyAnswer
      )

    GotQuestion (Just (CheekyQuestion question)) ->
      ( { model | question = CheekyQuestion question }
      , Random.generate GotAnswer randomStraightAnswer
      )


    GotAnswer (Just answer) ->
      ( { model | answer = answer }
      , Cmd.none
      )

    GotAnswer Nothing ->
      ( model
      , Random.generate GotQuestion randomQuestion
      )


randomQuestion =
  Random.Array.sample questions

randomStraightAnswer =
  Random.Array.sample straightAnswers

randomCheekyAnswer =
  Random.Array.sample cheekyAnswers

questionString : Question -> String
questionString question =
  case question of
    CheekyQuestion string ->
      string
    StraightQuestion string ->
      string


answerString : Answer -> String
answerString answer =
  case answer of
    CheekyAnswer string ->
      string
    StraightAnswer string ->
      string


-- view

view model = div []
  [ h1 [] [ text "Elm Against Humanity" ]

  , div
      [ class "question-card"
      , onClick DrawQuestion
      ]
      [ text (questionString model.question) ]

  , br [] []

  , div
      [ class "answer-card"
      ]
      [ text (answerString model.answer) ]
  ]


-- data

questions =
  Array.fromList
    [ CheekyQuestion "If _____ is the answer, you are asking the wrong question."
    , CheekyQuestion "The universe was brought into existence by _____"
    , CheekyQuestion "_____ brought the orgy to a grinding halt"
    , CheekyQuestion "_____ is the gift that keeps on giving."
    , CheekyQuestion "When all else fails, I can always masturbate to ________"
    , CheekyQuestion "I'd rather stick my dick in _____"
    , CheekyQuestion "My Kingdom for _____"
    , CheekyQuestion "Would you like _____ with that?"
    , CheekyQuestion "_____? We've got that."
    , CheekyQuestion "_____ is bringing sexy back"
    , CheekyQuestion "Science will never explain _____"
    , CheekyQuestion "It turns out that ______ wasn't a suitable birthday gift for my OH."
    , CheekyQuestion "And I would have gotten away with it, too, if it hadn't been for ________."
    , CheekyQuestion "Maybe she's born with it, maybe it's _____"
    , CheekyQuestion "Anthropologists have recently discovered a primitive tribe that worships _."
    , CheekyQuestion "It's a pity that kids these days are all getting involved with _."
    , CheekyQuestion "During Picasso's often-overlooked Brown Period, he produced hundreds of paintings of _."
    , CheekyQuestion "Alternative medicine is now embracing the curative powers of _."
    , CheekyQuestion "And the Academy Award for _ goes to _."
    , CheekyQuestion "I drink to forget _."
    , CheekyQuestion "This is the way the world ends. Not with a bang but with _."
    , CheekyQuestion "What's a girl's best friend?"
    , CheekyQuestion "TSA guidelines now prohibit _ on aeroplanes."
    , CheekyQuestion "_.  That's how I want to die."
    , CheekyQuestion "In the new Disney Channel Original Movie, Hannah Montana struggles with _ for the first time."
    , CheekyQuestion "Dear Agony Aunt, I'm having some trouble with _ and would like your advice."
    , CheekyQuestion "Instead of coal, Santa now gives the bad children _."
    , CheekyQuestion "What's the most emo?"
    , CheekyQuestion "In 1,000 years when paper money is but a distant memory, _ will be our currency."
    , CheekyQuestion "What's the next superhero/sidekick duo?"
    , CheekyQuestion "A romantic, candlelit dinner would be incomplete without _."
    , CheekyQuestion "_.  Betcha can't have just one!"
    , CheekyQuestion "_.  Oh well done you."
    , CheekyQuestion "Next from J.K. Rowling: Harry Potter and the Chamber of _."
    , CheekyQuestion "War!  What is it good for?"
    , CheekyQuestion "During sex, I like to think about _."
    , CheekyQuestion "What are my parents hiding from me?"
    , CheekyQuestion "What will always get you laid?"
    , CheekyQuestion "In L.A. County Jail, word is you can trade 200 cigarettes for _."
    , CheekyQuestion "In the distant future, historians will agree that ________ marked the beginning of humanity's decline."
    , CheekyQuestion "What will I bring back in time to convince people that I am a powerful wizard?"
    , CheekyQuestion "How am I maintaining my relationship status?"
    , CheekyQuestion "_.  It's a trap!"
    , CheekyQuestion "Coming to the West End this season, _: The Musical."
    , CheekyQuestion "But before I kill you, Mr. Bond, I must show you _."
    , CheekyQuestion "_____ gives me uncontrollable gas"
    , CheekyQuestion "The class field trip was completely ruined by _."
    , CheekyQuestion "When Pharaoh remained unmoved, Moses called down a Plague of _."
    , CheekyQuestion "My secret power is _____"
    , CheekyQuestion "There will be no _____ in heaven"
    , CheekyQuestion "Vin Diesel eat's _____ for breakfast"
    , CheekyQuestion "_: good to the last drop."
    , CheekyQuestion "Why am I sticky?"
    , CheekyQuestion "_____ gets better with age."
    , CheekyQuestion "What's the hipsterest?"
    , CheekyQuestion "_____ should consider euthanasia"
    , CheekyQuestion "Studies show that lab rats navigate mazes 50% faster after being exposed to _."
    , CheekyQuestion "I do not know with what weapons World War III will be fought, but World War IV will be fought with _."
    , CheekyQuestion "Why do I hurt all over?"
    , CheekyQuestion "I am giving up _____ for Lent."
    , CheekyQuestion "In an attempt to reach a wider audience, Natural History Museum has opened an interactive exhibit on _."
    , CheekyQuestion "When I am President of the universe, I will create the Department of _."
    , CheekyQuestion "Tonight Matthew, I'm going to be _____"
    , CheekyQuestion "When I am a billionaire, I shall erect a 50-foot statue to commemorate _."
    , CheekyQuestion "_____ is my antidote"
    , CheekyQuestion "____ never fails to liven up the party?"
    , CheekyQuestion "_____ is the the new fad diet"
    , CheekyQuestion "My plan for world domination begins with _."
    , CheekyQuestion "I learned the hard way that you can't cheer up a grieving friend with _."
    , CheekyQuestion "The socialist governments of Scandinavia have declared that access to _ is a basic human right."
    , CheekyQuestion "In his new self-produced album, Kanye West raps over the sounds of _."
    , StraightQuestion "____ is giving me problems in production"
    , StraightQuestion "Tell them that _____ is a feature, not a bug"
    , StraightQuestion "The internet is for cat memes and _____"
    , StraightQuestion "The Internet of Things will be controlled by ____"
    , StraightQuestion "_____ is unsupported in Internet Explorer"
    , StraightQuestion "We need to optimise _____"
    , StraightQuestion "______ is highly available, idempotent, and load balancing."
    , StraightQuestion "It's not a bug it's _____"
    , StraightQuestion "Fuctional programming can solve the problem of _____"
    , StraightQuestion "No one knows as much about _______ as the beardy dev in the corner"
    , StraightQuestion "My pull request was rejected because of _____"
    , StraightQuestion "My stacktrace revealed _____"
    , StraightQuestion "_____, because who needs monitoring. "
    , StraightQuestion "You can totally replace testing with _____"
    , StraightQuestion "Uncommented code leads to _____"
    , StraightQuestion "_____ gave me more errors than I started with"
    , StraightQuestion "_____ invalidated all our assumptions"
    , StraightQuestion "_____ wasted thousands of dollars"
    , StraightQuestion "No one can authenticate because of ______"
    , StraightQuestion "Everyone on the dev team had to work late bcause of ____"
    , StraightQuestion "_____ is mission critical"
    , StraightQuestion "I never truly understood eXtreme programming until I encountered _____"
    , StraightQuestion "End-to-end _____"
    , StraightQuestion "Javascript is the best language ever, thanks to _____"
    , StraightQuestion "Last night while drunk, the W3C declared _____ as a new web standard."
    , StraightQuestion "Only two things in deployment are certain, missed deadlines and _____"
    , StraightQuestion "_____ -driven development"
    , StraightQuestion "_____ ate all my memory"
    , StraightQuestion "_____ is always a good practice."
    , StraightQuestion "It's easy! Just run _____"
    , StraightQuestion "I assure you _____ is secure!"
    , StraightQuestion "Our backup policy is _____"
    , StraightQuestion "There are whisperings that the Google Headquarters has a secret room devoted to _____"
    , StraightQuestion "In a pinch, ________ can be a suitable substitute for ________."
    , StraightQuestion "In its new tourism campaign, Silicon Valley proudly proclaims that it has finally eliminated ________"
    , StraightQuestion "I bet the person who wrote this uses _____."
    , StraightQuestion "I enjoy _____, while my code is compiling."
    , StraightQuestion "Don't worry, we have unit tests for _____."
    , StraightQuestion "Blaming dev intern for _____"
    , StraightQuestion "_____ is my favourite thing about _____"
    , StraightQuestion "Dev morale would be improved if we had _____ in our office"
    , StraightQuestion "I've once been so drunk that _____ actually made sense"
    , StraightQuestion "Multiple backend penetration  is achieved with _____"
    , StraightQuestion "You can force kill your children by _____"
    , StraightQuestion "_____ corrupts your children's memory"
    , StraightQuestion "_____ behaves like a dangling socket"
    , StraightQuestion "Before you penetrate someone's backend, you first must _____"
    , StraightQuestion "I upload my worm to _____"
    , StraightQuestion "I fork my children with _____"
    , StraightQuestion "My shared socket connects to ____'s backend"
    , StraightQuestion "The only thing more dangerous than _____ is a programmer with _____"
    , StraightQuestion "Monads are easy! Just think of them as _________"
    , StraightQuestion "_____: powered by the cloud."
    , StraightQuestion "insertBerfore._______"
    , StraightQuestion "I once made a robot around the concept of _____"
    , StraightQuestion "According to trends on Github, the next big thing is _____"
    , StraightQuestion "It took over 40 hours to document _____. "
    , StraightQuestion "//TODO: _____."
    , StraightQuestion "npm install _____."
    , StraightQuestion "Support for _____ has finally arrived"
    , StraightQuestion "I got 99 github Issues but _____ ain't one"
    , StraightQuestion "_____: Doing it the Production way"
    , StraightQuestion "_____ : I like to do it functionally"
    , StraightQuestion "I think _____ needs tests"
    , StraightQuestion "I'll be working late because _____ is about to catch fire"
    , StraightQuestion "We wrote our own build tool based on _____"
    , StraightQuestion "We can't pay you, but we can offer _____ in compensation."
    , StraightQuestion "Development is 90% _____ and 10% _____"
    , StraightQuestion "Cowsay _____"
    , StraightQuestion "_____ worked in development"
    , StraightQuestion "We took the plunge and rewrote _______ in Go"
    , StraightQuestion "Implementing _____________ should take only 2 lines of code."
    , StraightQuestion "Learn _____ the hard way"
    , StraightQuestion "It's just a hack to make _____ run"
    , StraightQuestion "It's been 91 days since _____ was updated"
    , StraightQuestion "_____ is Turing complete"
    ]

straightAnswers =
  Array.fromList
    [ StraightAnswer "a MEAN developer stack"
    , StraightAnswer "'413: Entity Too Large' Errors"
    , StraightAnswer "Removing PHP from the development stack"
    , StraightAnswer "Flash"
    , StraightAnswer "Slower broadband speeds"
    , StraightAnswer "Faster upload time"
    , StraightAnswer "Code optimisation"
    , StraightAnswer "Refactoring"
    , StraightAnswer "a trendy young startup"
    , StraightAnswer "The Cult of Mac"
    , StraightAnswer "The fucking JVM"
    , StraightAnswer "Morning Standups"
    , StraightAnswer "The <body> tag"
    , StraightAnswer "Munging"
    , StraightAnswer "That goddam paperclip"
    , StraightAnswer "The smell of the guy from sysadmin"
    , StraightAnswer "syntactic sugar"
    , StraightAnswer "Sudo rm-rf /"
    , StraightAnswer "Inappropriately contracted variable names"
    , StraightAnswer "Spaces not tabs"
    , StraightAnswer "Stackoverflow is down??!!!!"
    , StraightAnswer "Ruby"
    , StraightAnswer "Sinatra"
    , StraightAnswer "-- What does this even do?"
    , StraightAnswer "Slackware"
    , StraightAnswer "Rack"
    , StraightAnswer "Short Stroking"
    , StraightAnswer "Someone not reading fucking manual"
    , StraightAnswer "Replacing all dev's machines with Raspberry Pis"
    , StraightAnswer "Regular Expressions"
    , StraightAnswer "Rebasing Master"
    , StraightAnswer "Git Force"
    , StraightAnswer "Git Push"
    , StraightAnswer "Pull requests"
    , StraightAnswer "Re-writing deployment scripts at 2 AM"
    , StraightAnswer "Read-only Fridays"
    , StraightAnswer "Programming while drunk"
    , StraightAnswer "Profanity in the git log"
    , StraightAnswer "Production"
    , StraightAnswer "PHP"
    , StraightAnswer "Patch Tuesday"
    , StraightAnswer "Linters"
    , StraightAnswer "Minimum Viable Product"
    , StraightAnswer "NPM"
    , StraightAnswer "Node"
    , StraightAnswer "Multiple measurement systems"
    , StraightAnswer "Mutation of immutable data"
    , StraightAnswer "Neckbeards"
    , StraightAnswer "Monads"
    , StraightAnswer "Women In Tech"
    , StraightAnswer "Merge Conflicts"
    , StraightAnswer "Filter-Map-Reduce"
    , StraightAnswer "Deleting more lines than you add"
    , StraightAnswer "a shared root password"
    , StraightAnswer "Mac OSX"
    , StraightAnswer "The ship-it squirrel"
    , StraightAnswer "Little Bobby Tables"
    , StraightAnswer "Legacy Code"
    , StraightAnswer "Linus Torvalds"
    , StraightAnswer "Kill -9"
    , StraightAnswer "Kernal panic"
    , StraightAnswer "Internet Explorer compatability hacks"
    , StraightAnswer "Infinite loops"
    , StraightAnswer "Github Issues"
    , StraightAnswer "Haskell"
    , StraightAnswer "Hate driven development"
    , StraightAnswer "The Mainframe"
    , StraightAnswer "Server Hum"
    , StraightAnswer "Cowsay Moo"
    , StraightAnswer "CEOs with root access"
    , StraightAnswer "command line options"
    , StraightAnswer "Commenting every line of code"
    , StraightAnswer "Committing from the bar."
    , StraightAnswer "Elm"
    , StraightAnswer "Continuous testing"
    , StraightAnswer "The Blue Screen of Death"
    , StraightAnswer "Tail recursion"
    , StraightAnswer "Object permanence."
    , StraightAnswer "recruiters"
    , StraightAnswer "Python"
    , StraightAnswer "the Bourne Again Shell"
    , StraightAnswer "The Apple start-up sound"
    , StraightAnswer "Windows NT"
    , StraightAnswer "Internet Explorer"
    , StraightAnswer "Elixir"
    ]

cheekyAnswers =
  Array.fromList
    [ CheekyAnswer "A disappointing birthday party."
    , CheekyAnswer "A drive-by shooting."
    , CheekyAnswer "A foul mouth."
    , CheekyAnswer "A hot mess."
    , CheekyAnswer "A lifetime of sadness."
    , CheekyAnswer "A look-see."
    , CheekyAnswer "A middle-aged man on roller skates."
    , CheekyAnswer "A windmill full of corpses."
    , CheekyAnswer "An erection that lasts longer than four hours."
    , CheekyAnswer "An icepick lobotomy."
    , CheekyAnswer "Anal beads."
    , CheekyAnswer "Attitude."
    , CheekyAnswer "Bees"
    , CheekyAnswer "Being a motherfucking sorcerer."
    , CheekyAnswer "Being on fire."
    , CheekyAnswer "Being rich."
    , CheekyAnswer "Breaking out into song and dance."
    , CheekyAnswer "Captain James T Kirk"
    , CheekyAnswer "Charisma."
    , CheekyAnswer "Crippling debt."
    , CheekyAnswer "Cuddling."
    , CheekyAnswer "Doing the right thing."
    , CheekyAnswer "Donald Trump"
    , CheekyAnswer "Dying of dysentery."
    , CheekyAnswer "Dying."
    , CheekyAnswer "Edible underpants."
    , CheekyAnswer "Eugenics."
    , CheekyAnswer "Expecting a burp and vomiting on the floor."
    , CheekyAnswer "Fear itself."
    , CheekyAnswer "Flying sex snakes."
    , CheekyAnswer "Friends with benefits."
    , CheekyAnswer "Frolicking."
    , CheekyAnswer "Full frontal nudity."
    , CheekyAnswer "German dungeon porn."
    , CheekyAnswer "Getting drunk on mouthwash."
    , CheekyAnswer "Getting naked and watching TVAM."
    , CheekyAnswer "Gloria Gaynor"
    , CheekyAnswer "Goats eating cans."
    , CheekyAnswer "Goblins."
    , CheekyAnswer "Guys who don't call."
    , CheekyAnswer "Harry Potter erotica."
    , CheekyAnswer "Heteronormativity."
    , CheekyAnswer "Hormone injections."
    , CheekyAnswer "Horrifying laser hair removal accidents."
    , CheekyAnswer "Incest."
    , CheekyAnswer "Intelligent design."
    , CheekyAnswer "Justin Timberlake"
    , CheekyAnswer "Kamikaze pilots."
    , CheekyAnswer "Kligons on the starboard bow"
    , CheekyAnswer "Lactation."
    , CheekyAnswer "Licking things to claim them as your own."
    , CheekyAnswer "Lingerie for men"
    , CheekyAnswer "Masturbation."
    , CheekyAnswer "Me time."
    , CheekyAnswer "Morgan Freeman's voice."
    , CheekyAnswer "My collection of high-tech sex toys."
    , CheekyAnswer "My relationship status."
    , CheekyAnswer "Naked hippies"
    , CheekyAnswer "Natural selection."
    , CheekyAnswer "Nazis"
    , CheekyAnswer "Nocturnal emissions."
    , CheekyAnswer "One ring to rule them all"
    , CheekyAnswer "Onion induced tears"
    , CheekyAnswer "Oversized lollipops."
    , CheekyAnswer "Pac Man"
    , CheekyAnswer "Panda sex."
    , CheekyAnswer "Parting the Red Sea."
    , CheekyAnswer "Porn Stars."
    , CheekyAnswer "Powerful thighs."
    , CheekyAnswer "Pterodactyl eggs."
    , CheekyAnswer "Puberty."
    , CheekyAnswer "Puppies!"
    , CheekyAnswer "Raptor attacks."
    , CheekyAnswer "Repression."
    , CheekyAnswer "RoboCop."
    , CheekyAnswer "Roofies."
    , CheekyAnswer "Saxophone solos."
    , CheekyAnswer "Scalping."
    , CheekyAnswer "Scrubbing under the folds."
    , CheekyAnswer "Self loathing"
    , CheekyAnswer "Sexting."
    , CheekyAnswer "Sexy pillow fights."
    , CheekyAnswer "Smallpox blankets."
    , CheekyAnswer "Sniffing glue."
    , CheekyAnswer "Snoop Dog"
    , CheekyAnswer "Spontaneous human combustion."
    , CheekyAnswer "Sunshine and rainbows."
    , CheekyAnswer "Swooping."
    , CheekyAnswer "Taking off your shirt."
    , CheekyAnswer "Tasteful sideboob."
    , CheekyAnswer "Team-building exercises."
    , CheekyAnswer "Testicular torsion."
    , CheekyAnswer "The American Dream"
    , CheekyAnswer "The Big Bang."
    , CheekyAnswer "The Hustle."
    , CheekyAnswer "The Rapture."
    , CheekyAnswer "The clitoris."
    , CheekyAnswer "The folly of man."
    , CheekyAnswer "The forbidden fruit."
    , CheekyAnswer "The glass ceiling."
    , CheekyAnswer "The heart of a child."
    , CheekyAnswer "The taint; the grundle; the fleshy fun-bridge."
    , CheekyAnswer "The thing that electrocutes your abs."
    , CheekyAnswer "U2"
    , CheekyAnswer "Unfathomable stupidity."
    , CheekyAnswer "Vintage Abba costumes"
    , CheekyAnswer "Women's suffrage."
    , CheekyAnswer "YOU MUST CONSTRUCT ADDITIONAL PYLONS."
    , CheekyAnswer "Yeast."
    , CheekyAnswer "firehooping ninjas"
    , CheekyAnswer "morning sex"
    , CheekyAnswer "my penis"
    , CheekyAnswer "taking modafinil and staying up all night"
    , CheekyAnswer "trendy undercuts"
    ]
