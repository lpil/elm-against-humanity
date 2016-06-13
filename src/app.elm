import Html exposing (..)
import Html.Attributes exposing (class)
import Html.App

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
  = GetAnother

update : Msg -> Model -> (Model, Cmd Msg)
update action model =
  ( model
  , Cmd.none
  )


-- view

view model = div []
  [ h1 [] [ text "Elm Against Humanity" ]
  , div [class "question-card"] [ text (questionString model.question) ]
  , div [class "answer-card"] [ text (answerString model.answer) ]
  ]


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
