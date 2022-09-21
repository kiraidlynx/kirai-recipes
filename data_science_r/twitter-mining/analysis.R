setwd("GitHub/DS-usefull-functions/10 - twitter/")

##LIBRERIAS NECESARIAS

install.packages("twitteR")
install.packages("RColorBrewer")
install.packages("ggplot2")
install.packages("devtools")
install.packages("httr")
install.packages("slam")

#DESCARGA EXTERNA
install.packages("SentimentR")
install.packages("Rstem")

#LIBRERIAS ACTUALIZADAS CON NOMBRE DISTINTO

install.packages("SentimentAnalysis")
install.packages("SnowballC")

##REQUISITOS

require(devtools)
Sys.getenv("PATH")


#ACTIVACIÓN DE LIBRERIAS

library(twitteR)
library(slam)
library(sentimentr)


#Se define las variables para el acceso al API de twitter

api_key <- "CpBCPxgNziJeEN5Qkbe5bhRh5"
api_secret <- "ZhNjtYHZsiBjtZxuvG49FJ9kJfuXofKGsUUSGw4KB7pWiUkf6n"
access_token <- "225356968-c3yKsrBsQ6V5sAg2vuqfT505mSqLkWZUNROY5pkN"
access_token_secret <- "UZRAHZsJ93paLJhP8kdg3W4lWKM8a0noTgY6kVq66Z98v"


#COMPROBAR CONEXION

setup_twitter_oauth(api_key,api_secret,access_token, access_token_secret)


#BUSCAR TWEETS
tweets<-searchTwitter("laliga", n=1500, lang="es")

#LIMPIAR TWEETS
texts<-sapply(tweets, function(x) x$getText())


#FUNCION LIMPIAR TEXTO
clean.data<-function(text){
  
  #eliminar re-tweets y @ del texto original - EXPRESSION REGULAR
  text=gsub("(RT|VIA)((?:\\b\\W*@\\w+)+)","", text)
  text=gsub("@\\w+", "", text)
  
  #eliminar signos de puntuación y dígitos
  text=gsub("[[:punct:]]", "", text)
  text=gsub("[[:digit:]]", "", text)
  
  #eliminar links html, tab y espacios adicionales
  text=gsub("http\\w+", "", text)
  text=gsub("[ \t]{2,} ", "", text)
  text=gsub("^\\s+|\\s+$", "", text)
  
}


texts<-clean.data(texts)

#GESTIONAR POSIBLES NAs
handle.error<-function(x){
  #crear el valor omitido
  y=NA
  #try_catch error
  try_error<-tryCatch(tolower(x), error=function(e) e)
  #si no hay error
  if(!inherits(try_error, "error"))
    y=tolower(x)
  #devolvemos resultado
  return(y)
}

texts=sapply(texts, handle.error)


#ELIMINAR NAs y NULIFICAR COLUMNA NOMBRES
texts<-texts[!is.na(texts)]
names(texts)<-NULL

#ANALISIS DE SENTIMIENTO - Naïve-Bayes

class_emo <-emotion(texts)

head(class_emo$emotion_type)













