# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
 $("#user_postalcode").jpostal({
 postcode : ["#user_postalcode"],
 address : {
 	"#user_prefecture_name" : "%3",
 	"#user_address_city" : "%4%5",
 	"#user_address_street" : "%6%7",

 			}
 });