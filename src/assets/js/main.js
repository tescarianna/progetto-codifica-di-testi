/*-- FUNZIONI --*/

/* 
    Funzione che consente di visualizzare l'header menu anche quando si scorre la pagina 
*/
function manageHeaderScroll() {
    var header = document.querySelector(".header");
    var scrollY = window.pageYOffset;
    if (scrollY > 0) {
        document.querySelector('body').classList.add('scrolled');
        //Applica la classe ".header-scroll" all'header per mantenerlo leggibile quando si scrolla la pagina
        header.classList.add("header-scroll");
    } else {
        document.querySelector('body').classList.remove('scrolled');
        header.classList.remove("header-scroll");
    }
}

/*
    Funzione che gestisce il comportamento della lista di bottoni con cui è possibile filtrare i tag provenienti dall'xml
*/
function manageTagNavigator() {
    var tagNavigatorTrigger = document.querySelector('.page-content-filters-trigger');
    var tagNavigatorDeactivate = document.querySelector('.page-content-filters-trigger-remove');
    var tagNavigator = document.querySelector('.page-content-filters');
    var scrollY = window.pageYOffset;
    var winHeight = window.innerHeight;
    var scrollBottom = scrollY + winHeight;
    if (scrollBottom >= tagNavigatorTrigger.offsetTop && scrollBottom <= tagNavigatorDeactivate.offsetTop) {
        tagNavigator.classList.add('active');
    } else if (scrollBottom < tagNavigatorTrigger.offsetTop || scrollBottom >= tagNavigatorDeactivate.offsetTop + 300) {
        tagNavigator.classList.remove('active');
    }
}
/*
    Funzione per inizializzare lo slider che contiene le pagine
*/
function startSlider() {
    var slideIndex = 1;

    //Mostro la slide di indice "n"
    function showSlides(n) {
        var i;
        var slides = document.querySelectorAll(".carousel .carousel-slides .carousel-slide");
        if (n > slides.length) {
            slideIndex = 1
        }
        if (n < 1) {
            slideIndex = slides.length
        }
        for (i = 0; i < slides.length; i++) {
            slides[i].style.display = "none";
        }
        slides[slideIndex - 1].style.display = "block";
    }

    //"Muove" l'indice della slide attiva
    function plusSlides(n) {
        showSlides(slideIndex += n);
    }

    //Array che contenente gli elementi "freccia avanti/indietro"
    var sliderArrows = {
        prev: document.querySelector(".carousel .carousel-arrow-prev"),
        next: document.querySelector(".carousel .carousel-arrow-next")
    };

    //Al click sulla freccia indietro viene invocata la funzione plusSlides con indice -1 in modo da tornare indietro di 1
    sliderArrows.prev.addEventListener("click", () => {
        plusSlides(-1)
    });

    //Al click sulla freccia avanti viene invocata la funzione plusSlides con indice 1 in modo da andare avanti di 1
    sliderArrows.next.addEventListener("click", () => {
        plusSlides(1)
    });

    showSlides(slideIndex);
}
/*
    Funzione che gestisce il funzionamento dei filtri dei tag provenienti dall'xml
*/
function manageFilters() {
    //Scorro tutti i bottoni che hanno classe .legend-filter
    document.querySelectorAll('.page-content-filters .legend-filter').forEach((element) => {
        //Per ogni bottone resto in ascolto sull'evento "click"
        element.addEventListener('click', (e) => {
            var curElement = e.currentTarget;
            var tagToFilter = curElement.getAttribute('data-filter-tag'); //Contiene la tipologia di tag che il bottone filtra
            var textContainers = document.querySelectorAll('.analyzed-text'); //Contiene tutti gli elementi in cui sono presenti le traduzioni
            //Scorro tutti i "contenitori di testo" che ospitano le traduzioni
            textContainers.forEach((textContainer) => {

                if (!curElement.classList.contains('active')) {
                    //Scorro tutti i tag che hanno la classe uguale al tag e li evidenzio
                    textContainer.querySelectorAll('.' + tagToFilter).forEach(tag => {
                        tag.classList.add('highlighted');
                    });
                }
                //In caso di click viene disattivo il filtro a lui associato
                else if (curElement.classList.contains('active')) {
                    //Scorro tutti i tag che hanno la classe uguale al tag oggetto del filtro e li disattivo
                    textContainer.querySelectorAll('.' + tagToFilter).forEach(tag => {
                        tag.classList.remove('highlighted');
                    });
                }
            });
            //Attivo/disattivo la classe che mette in evidenza il bottone
            if (!curElement.classList.contains('active')) {
                curElement.classList.add('active');
            } else {
                curElement.classList.remove('active');
            }
            //Ricalcolo l'altezza delle pericopi
            sameHeightElements();
        });
    });
}

/*
    Funzione per eseguire lo scroll animato verso un determinato elemento 
    Fonte: https://stackoverflow.com/a/31987330
*/
function scrollTo(element, offset = 0) {
    if (element === null) {
        return;
    }
    window.scroll({
        behavior: 'smooth',
        left: 0,
        top: (element.getBoundingClientRect().top + window.scrollY) - document.querySelector('.header').offsetHeight - offset
    });
}

/*
    Funzione che si occupa di gestire la presenza di un # nell'URL di pagina così da gestire lo scroll all'elemento corrispondente
*/
function handleAnchorNavigation(e) {
    //Salvo l'eventuale hash presente nella URL
    var hash = window.location.hash;

    if (hash !== '') {
        //Se nell'hash è presente la sottostringa _line vuol dire che è relativo al click su una delle zone presenti sull'immagine dello slider
        if (hash.includes("_line")) {
            var elementToScrollID = hash;
            //Al fine di individuare l'elemento a cui l'hash fa riferimento rimuoviamo la sottostringa _line e salvo l'hash che corrisponderà all'id dell'elemento a cui scrollare
            elementToScrollID = elementToScrollID.replace('_line', '');
            //Rimuovo l'highlight dalla riga precedentemente cliccata
            document.querySelectorAll('.analyzed-text .row-number').forEach(element => {
                element.classList.remove('highlighted');
            });
            //Aggiungo la classe .highlighted all'elemento che ha ID corrispondente alla riga selezionata
            document.querySelector(elementToScrollID).classList.add('highlighted');
            //Eseguo lo scroll all'elemento
            scrollTo(document.querySelector(elementToScrollID), 100);
        } else {
            //Gestisco lo scroll all'elemento quando nell'hash non è presente la sottostringa "_line" 
            scrollTo(document.querySelector(window.location.hash));
        }
    }
}

//Funzione che si occupa di allineare le altezze delle pericopi
function sameHeightElements() {
    document.querySelectorAll("[data-same-height]").forEach(element => {
        var sameHeightID = element.getAttribute('data-same-height');
        var finalHeight = element.offsetHeight;
        document.querySelectorAll('[data-same-height=' + sameHeightID + ']').forEach(elementB => {
            if (elementB.offsetHeight > finalHeight) {
                finalHeight = elementB.offsetHeight;
            }
        });
        element.style.minHeight = finalHeight + "px";
    });
}

/*-- DOCUMENTO CARICATO --*/
document.addEventListener('DOMContentLoaded', () => {
    /* 
        Eseguo le due funzioni in modo da intercettare la casistica in cui la pagina viene
        caricata con un offset di scroll maggiore di 0
    */
    manageHeaderScroll();
    manageTagNavigator();
    /* 
        Registro le funzioni manageHeaderScroll() e manageTagNavigator() sull'evento "onscroll" così 
        che vengano eseguite ogni volta che si esegue lo scroll sulla pagina
    */
    window.onscroll = function() {
        manageHeaderScroll();
        manageTagNavigator();
    }

    window.onresize = function() {
        sameHeightElements();
    }

    //Avvio la funzione che regola l'altezza delle pericopi
    sameHeightElements();

    // Inizializzo lo slider di pagine
    startSlider();
    // Eseguo la logica dei filtri
    manageFilters();

    //Rimuovo il # dagli elementi "riga" così che in caso di presenza di hash con sottostringa _line possa effettuare lo scroll al loro offset
    document.querySelectorAll('.row-number').forEach((element) => {
        element.setAttribute('id', element.getAttribute('id').replace('#', ''));
    });

    //Eseguo la logica che verifica la presenza di un # nella URL ed esegue lo scroll all'elemento di ID corrispondente
    handleAnchorNavigation();
    //Intercetto il cambiamento del # nell'URL
    window.addEventListener('hashchange', handleAnchorNavigation);
    //Faccio in modo che gli elementi con classe "scroll-to" scrollino verso l'elemento che ha lo stesso ID del loro href
    document.querySelectorAll('.scroll-to').forEach(element => {
        element.addEventListener('click', (e) => {
            e.preventDefault();
            var elementToScrollID = e.currentTarget.getAttribute('href');
            scrollTo(document.querySelector(elementToScrollID));
        });
    });
});