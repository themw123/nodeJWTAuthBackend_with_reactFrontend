
Dies ist ein Projekt, indem ich einen Nodejs Server als Backend Lösung im Zusammenspiel mit einer React Frontend Anbindung ausprobiert habe. Zudem verwende ich JWT Token für den Login Prozess.

Login:
![Alt text](/img/login.png)

Eingeloggt:
![Alt text](/img/loggedin.png)

Backend abfragen:
![Alt text](/img/platinen.png)


Erstelle die Datenbank und den Benutzter mittels der .sql Datei.
Ansonnsten wird der node server abstürtzen.

react-script update evt nötig und installation von concurrently:
```  
npm update
npm install --save react-scripts@latest
npm install concurrently --save-dev
```

Starte beides, React Frontend und Node Backend mit:
```  
npm start
```



