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

update : Msg -> Model -> (Model, Cmd Msg)
update action model =
  case action of
    DrawQuestion ->
      (model, Random.generate GotQuestion questionGenerator)

    GotQuestion (Nothing) ->
      (model, Random.generate GotQuestion questionGenerator)

    GotQuestion (Just question) ->
      ( { model | question = question }
      , Cmd.none
      )


questionGenerator =
  Random.Array.sample questions


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
    , StraightQuestion "To understand _____ you must first understand _____."
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
