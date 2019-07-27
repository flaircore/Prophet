//+------------------------------------------------------------------+
//|                                                      Prophet.mq5 |
//|                                              Nicholas Njobu Babu |
//|                                       https://www.flaircore.com/ |
//+------------------------------------------------------------------+
#property copyright "Nicholas Njobu Babu"
#property link      "https://www.flaircore.com/"
#property version   "1.00"
//+------------------------------------------------------------------+
//| Expert initialization function                                   |
//+------------------------------------------------------------------+
int OnInit()
  {
//---
   
//---
   return(INIT_SUCCEEDED);
  }
//+------------------------------------------------------------------+
//| Expert deinitialization function                                 |
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
  {
//---
   
  }
//+------------------------------------------------------------------+
//| Expert tick function                                             |
//+------------------------------------------------------------------+
void OnTick()
  {
//---
      
      double HighestCandleM15 = getHighestCandleM15();
      double LowestCandleM15 = getLowestCandleM15();
      
      Comment (
      "\n Highest Candle M15:| ", HighestCandleM15,
      "\n Lowest Candle M15:| ",LowestCandleM15,
      "\n Highest Candle M5:| ", getHighestCandleM5(),
      "\n Lowest Candle M5:| ",getLowestCandleM5(),
      "\n Highest Candle M1:| ", getHighestCandleM1(),
      "\n Lowest Candle M1:| ",getLowestCandleM1()
      
      );
      
      // Set Object Properties for a label
      ObjectCreate(_Symbol,"Label1",OBJ_LABEL,0,0,0);
      
      // Set object Font
      ObjectSetString(0,"Label1",OBJPROP_FONT,"Consolas");
      
      // Set font size
      ObjectSetInteger(0,"Label1",OBJPROP_FONTSIZE,24);
      
      // Set Label Text
      ObjectSetString(_Symbol,"Label1",OBJPROP_TEXT,0,"Lowest Candle M15:| "+LowestCandleM15);
      
      // Set distance from left border
      ObjectSetInteger(0,"Label1",OBJPROP_XDISTANCE, 200);
      
      // Set distance from upper border
      ObjectSetInteger(0,"Label1",OBJPROP_YDISTANCE,10);
  }
//+------------------------------------------------------------------+

// M15 Highest
double getHighestCandleM15()
   {
      double HighestCandleM15; // var to hold out highest candle
      double High[];// array to hold our price info
      ArraySetAsSeries(High,true);//
      CopyHigh(_Symbol,PERIOD_M15,0,15,High);// Copy current chart symbol, period M15, from candle 0-15, copy to High array
      // Below find the highest candle
      HighestCandleM15 = ArrayMaximum(High,0,15);
      return HighestCandleM15;
   }

// M15 Lowest 
double getLowestCandleM15()
   {
      double LowestCandleM15;
      double Low[];
      ArraySetAsSeries(Low,true);
      CopyLow(_Symbol,PERIOD_M15,0,15,Low);
      LowestCandleM15 = ArrayMinimum(Low,0,15);
      
      //Comment ("Lowest candle in 15 is: ", LowestCandleM15);
      return LowestCandleM15;
   }
 

// M5 Highest NB comments lie
double getHighestCandleM5()
   {
      double HighestCandleM5; // var to hold out highest candle
      double High[];// array to hold our price info
      ArraySetAsSeries(High,true);//
      CopyHigh(_Symbol,PERIOD_M5,0,15,High);// Copy current chart symbol, period M15, from candle 0-15, copy to High array
      // Below find the highest candle
      HighestCandleM5 = ArrayMaximum(High,0,15);
      return HighestCandleM5;
   }

// M5 Lowest 
double getLowestCandleM5()
   {
      double LowestCandleM5;
      double Low[];
      ArraySetAsSeries(Low,true);
      CopyLow(_Symbol,PERIOD_M5,0,15,Low);
      LowestCandleM5 = ArrayMinimum(Low,0,15);
      
      //Comment ("Lowest candle in 15 is: ", LowestCandleM15);
      return LowestCandleM5;
   }


// M1 Highest
double getHighestCandleM1()
   {
      double HighestCandleM1; // var to hold out highest candle
      double High[];// array to hold our price info
      ArraySetAsSeries(High,true);//
      CopyHigh(_Symbol,PERIOD_M1,0,15,High);// Copy current chart symbol, period M15, from candle 0-15, copy to High array
      // Below find the highest candle
      HighestCandleM1 = ArrayMaximum(High,0,15);
      return HighestCandleM1;
   }

// M1 Lowest 
double getLowestCandleM1()
   {
      double LowestCandleM1;
      double Low[];
      ArraySetAsSeries(Low,true);
      CopyLow(_Symbol,PERIOD_M1,0,15,Low);
      LowestCandleM1 = ArrayMinimum(Low,0,15);
      
      //Comment ("Lowest candle in 15 is: ", LowestCandleM15);
      return LowestCandleM1;
   }