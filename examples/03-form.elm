import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onInput, onClick)
import Char

main =
  Html.beginnerProgram
    { model = model
    , view = view
    , update = update
    }

-- MODEL

type alias Model =
  { name : String
  , age : String
  , password : String
  , passwordAgain : String
  , checkValid : String
  }


model : Model
model =
  Model "" "0" "" "" "N"

-- UPDATE

type Msg
    = Name String
    | Age String
    | Password String
    | PasswordAgain String
    | CheckValid

update : Msg -> Model -> Model
update msg model =
  case msg of
    Name name ->
      { model | name = name, checkValid = "N" }
    Age age ->
      { model | age = age, checkValid = "N"}
    Password password ->
      { model | password = password, checkValid = "N" }
    PasswordAgain password ->
      { model | passwordAgain = password, checkValid = "N" }
    CheckValid ->
      { model | checkValid = "Y" }

-- VIEW

view : Model -> Html Msg
view model =
  div []
    [ input [ type_ "text", placeholder "Name", onInput Name ] []
    , input [ type_ "text", placeholder "Age", onInput Age ] []
    , input [ type_ "password", placeholder "Password", onInput Password ] []
    , input [ type_ "password", placeholder "Re-enter Password", onInput PasswordAgain ] []
    , input [ type_ "submit", onClick CheckValid ] []
    , viewValidation model
    ]


viewValidation : Model -> Html msg
viewValidation model =
  let
    (color, message) =
      if (model.checkValid == "Y") then
        if (String.length model.age > 0) && (not (String.all Char.isDigit model.age)) then
          ("blue", "Age must be a number")
        else if not (String.any Char.isUpper model.password) then
          ("blue", "Passwords must contain an Uppercase!")
        else if not (String.any Char.isLower model.password) then
          ("blue", "Passwords must contain an Lowercase!")
        else if String.length model.password < 8 then
          ("blue", "Passwords must be at least 8 characters long!")
        else if not (String.any Char.isDigit model.password) then
          ("blue", "Passwords must contain a digit!")
        else if not (model.password == model.passwordAgain) then
          ("blue", "Passwords must match")
        else
           ("green", "Okay")
      else
        ("blue", "")
  in
    div [ style [("color", color)] ] [ text message ]
