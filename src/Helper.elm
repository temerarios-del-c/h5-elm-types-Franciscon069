module Helper exposing (..)

import Browser
import Html exposing (..)
import Html.Attributes exposing (src)
import Html.Events exposing (onClick)


type alias Model =
    { indice : Int }


init : Model
init =
    { indice = 0 }


imagenes : List String
imagenes =
    [ "https://tse4.mm.bing.net/th/id/OIP.OvQNCbYUN7c16CAQKIsa2QHaEK?pid=Api&P=0&h=180"
    , "https://tse1.mm.bing.net/th/id/OIP.e6Zw_XQi4cyq0jgJ12j2xwHaEK?pid=Api&P=0&h=180"
    ]


imagenActual : Int -> String
imagenActual indice =
    Maybe.withDefault "" (List.head (List.drop indice imagenes))


type Msg
    = Siguiente
    | Anterior


update : Msg -> Model -> Model
update msg model =
    case msg of
        Siguiente ->
            { model | indice = modBy (List.length imagenes) (model.indice + 1) }

        Anterior ->
            { model | indice = modBy (List.length imagenes) (model.indice - 1) }


view : Model -> Html Msg
view model =
    div []
        [ button [ onClick Anterior ] [ text "←" ]
        , img [ src (imagenActual model.indice) ] []
        , button [ onClick Siguiente ] [ text "→" ]
        ]


main =
    Browser.sandbox
        { init = init
        , update = update
        , view = view
        }
