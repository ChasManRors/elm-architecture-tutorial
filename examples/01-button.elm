import Html exposing (Html, button, div, text)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick)


main : Program Never Model Msg
main =
  Html.beginnerProgram
    { model = model
    , view = view
    , update = update
    }

-- MODEL
type alias Model = Int

model : Model
model =
  0

-- UPDATE
type Msg
  = Increment
  | Decrement
  | Reset



update : Msg -> Model -> Model
update msg model =
  case msg of
    Increment ->
      model + 1000

    Decrement ->
      model - 1

    Reset ->
      0



-- VIEW
view : Model -> Html Msg
view model =
  div [ Html.Attributes.style
            [ ( "backgroundColor", "white" )
            , ( "height", "300px" )
            , ( "width", "300px" )
            , ( "position", "relative" )
            , ( "left", "100px" )
            , ( "top", "50px" )
            ]]
    [ button [ onClick Decrement ] [ text "-" ]
    , div [] [ text ( toString model) ]
    , button [ onClick Increment ] [ text "+ 1000" ]
    , div [] [ text ("----------") ]
    , button [ onClick Reset ] [ text "Zero" ]
    ]
