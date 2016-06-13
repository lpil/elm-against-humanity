import Html exposing (..)
import Html.App

main =
  Html.App.program
    { init = init
    , subscriptions = subscriptions
    , update = update
    , view = view
    }


-- Model

type QuestionCard
  = CheekyQuestion String
  | StraightQuestion String

type AnswerCard
  = CheekyAnswer String
  | StraightAnswer String

type alias Model =
  { question : QuestionCard
  , answer : AnswerCard
  }

init : (Model, Cmd Msg)
init =
  ( { question = CheekyQuestion ""
    , answer = CheekyAnswer ""
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
  ]
