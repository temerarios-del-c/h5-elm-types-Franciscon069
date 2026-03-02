module Helper exposing (..)


type Grade
    = Approved
    | Failed
    | Pending


type AirplaneStatus
    = Cancelled
    | Delayed
    | OnTime
    | Boarding


categoricalGrade : List Float -> List Grade
categoricalGrade grades =
    List.map gradeFromFloat grades


gradeFromFloat : Float -> Grade
gradeFromFloat grade =
    if grade >= 7 then
        Approved

    else if grade >= 0 then
        Failed

    else
        Pending


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
airportAction statuses =
    List.map airplaneScheduleAction statuses
