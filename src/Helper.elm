module Helper exposing (..)

import Browser
import Html exposing (..)
import Html.Attributes exposing (src)
import Html.Events exposing (onClick)



-- CARRUSEL (tu código original)


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


main : Program () Model Msg
main =
    Browser.sandbox
        { init = init
        , update = update
        , view = view
        }



-- CALIFICACIONES (requerido por TestSuite)


type Grade
    = Approved
    | Failed
    | Pending


categoricalGrade : List Float -> List Grade
categoricalGrade list =
    List.map
        (\grade ->
            if grade >= 7 then
                Approved

            else if grade >= 0 then
                Failed

            else
                Pending
        )
        list



-- VUELOS (requerido por TestSuite)


type AirplaneStatus
    = Cancelled
    | Delayed
    | OnTime
    | Boarding


airplaneScheduleAction : AirplaneStatus -> String
airplaneScheduleAction status =
    case status of
        Cancelled ->
            "Pedir reembolso"

        Delayed ->
            "Esperar"

        OnTime ->
            "Esperar"

        Boarding ->
            "Buscar boleto"


airportAction : List AirplaneStatus -> List String
airportAction list =
    List.map airplaneScheduleAction list
