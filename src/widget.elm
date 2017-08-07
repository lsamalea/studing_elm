import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (on)
import Json.Decode as Decode

type alias Time = {date: String}
type alias LogsInfo =
  { logs : List String
  }

type alias TimeInfo =
  { events : List (Time, Float)
  , yAxis : String
  }

type alias ScatterInfo =
  { points : List (Float, Float)
  , xAxis : String
  , yAxis : String
  }
  
type Widget = Logs LogsInfo | TimePlot TimeInfo | ScatterPlot ScatterInfo

-- helpers
viewLogs info = 
  toString info
  
viewTime timeInfo = 
  toString timeInfo

viewScatter scatterInfo = 
  toString scatterInfo

-- view
view : Widget -> String
view widget =
  case widget of
    Logs info ->
      viewLogs info

    TimePlot info ->
      viewTime info

    ScatterPlot info ->
      viewScatter info
      
widgetA: Widget
widgetA = Logs {logs = ["A","B"]}



widgetB: Widget
widgetB = ScatterPlot {points = [(1.2, 2.3)], xAxis= "12", yAxis="12"}


main =
  text (toString [(view widgetA), (view  widgetB)])