<cfset REQUEST.googleAPIKey = "" />

<cfscript>

function googleTranslate(String sourceString, String sourceLang, String targetLang){
   var requestBody = {};
   requestBody['q'] = sourceString;
   requestBody['source'] = sourceLang;
   requestBody['target'] = targetLang;
   requestBody['format'] = "text";

   http url="https://translation.googleapis.com/language/translate/v2" method="POST"{
      httpparam type="URL" name="key" value="#REQUEST.googleAPIKey#";
      httpparam type="header" name="Content-Type" value="application/json";
      httpparam type="body" value="#serializeJSON(requestBody)#";
   }

   if (cfhttp.status_code eq 200){
      var structResult = deserializeJSON(cfhttp.filecontent);
      return structResult.data.translations[1].translatedText
   }else{
      return "";
   }
}

function traverseTranslate(Struct sourceStruct, String sourceLang, String targetLang){
   return sourceStruct.map(function(k, v){
      if(isStruct(v)){         
         return traverseTranslate(v, sourceLang, targetLang);
      }else{
         return googleTranslate(v, sourceLang, targetLang);
      }
   });   
}

jsonSource = fileRead('en.json');
structSource = deserializeJSON(jsonSource);
// dump(structSource); 

structDestination = traverseTranslate(structSource, 'en', 'pl');
// dump(structDestination);
fileWrite('pl.json', serializeJSON(structDestination));

structDestination = traverseTranslate(structSource, 'en', 'uk');
// dump(structDestination);
fileWrite('uk.json', serializeJSON(structDestination));

structDestination = traverseTranslate(structSource, 'en', 'ru');
// dump(structDestination);
fileWrite('ru.json', serializeJSON(structDestination));

</cfscript>