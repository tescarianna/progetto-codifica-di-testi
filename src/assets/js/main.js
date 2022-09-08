/*-- FUNZIONI --*/

/* 
    Applica la classe ".header-scroll" all'header in modo da rendere leggibile il suo contenuto quando
    si fa scroll sulla pagina
*/
function manageHeaderScroll() {
    var header = document.querySelector(".header");
    var scrollY = window.pageYOffset;
    if (scrollY > 0) {
        document.querySelector('body').classList.add('scrolled');
        header.classList.add("header-scroll");
    } else {
        document.querySelector('body').classList.remove('scrolled');
        header.classList.remove("header-scroll");
    }
}

/*
    Questa funzione gestisce il comportamento della lista di bottoni con cui è possibile filtrare i tag provenienti dall'xml
*/
function manageTagNavigator() {
    //Show tag navigator when scrolling down
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
    Inizializza lo slider che contiene le pagine
*/
function startSlider() {
    var slideIndex = 1;

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

    function plusSlides(n) {
        showSlides(slideIndex += n);
    }

    var sliderArrows = {
        prev: document.querySelector(".carousel .carousel-arrow-prev"),
        next: document.querySelector(".carousel .carousel-arrow-next")
    };

    sliderArrows.prev.addEventListener("click", () => {
        plusSlides(-1)
    });
    sliderArrows.next.addEventListener("click", () => {
        plusSlides(1)
    });

    showSlides(slideIndex);
}
/*
    Gestisce il funzionamento dei filtri
*/
function manageFilters() {
    document.querySelectorAll('.page-content-filters .legend-filter').forEach((element) => {
        element.addEventListener('click', (e) => {
            var curElement = e.currentTarget;
            var tagToFilter = curElement.getAttribute('data-filter-tag');
            var textContainers = document.querySelectorAll('.analyzed-text');
            textContainers.forEach((textContainer) => {
                if (!curElement.classList.contains('active')) {
                    textContainer.querySelectorAll('.' + tagToFilter).forEach(tag => {
                        tag.classList.add('highlighted');
                    });
                } else if (curElement.classList.contains('active')) {
                    textContainer.querySelectorAll('.' + tagToFilter).forEach(tag => {
                        tag.classList.remove('highlighted');
                    });
                }
            });
            if (!curElement.classList.contains('active')) {
                curElement.classList.add('active');
            } else {
                curElement.classList.remove('active');
            }
        });
    });
}

/*
    Funzione per eseguire lo scroll animato verso un determinato elemento
    https://stackoverflow.com/a/31987330
*/
function scrollTo(element, offset = 0) {
    window.scroll({
        behavior: 'smooth',
        left: 0,
        top: element.offsetTop - document.querySelector('.header').offsetHeight - offset
    });
}

/*
    Gestisce la presenze di un # nell'URL di pagina così da gestire lo scroll all'elemento corrispondente
*/
function handleAnchorNavigation(e) {
    var hash = window.location.hash;
    if (hash !== '') {
        if (hash.includes("_line")) {
            var elementToScrollID = hash;
            elementToScrollID = elementToScrollID.replace('_line', '');
            document.querySelectorAll('.analyzed-text .row-number').forEach(element => {
                element.classList.remove('highlighted');
            });
            document.querySelector(elementToScrollID).classList.add('highlighted');
            scrollTo(document.querySelector(elementToScrollID), 100);
        } else {
            scrollTo(document.querySelector(window.location.hash));
        }
    }
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
    // Inizializzo lo slider di pagine
    startSlider();
    // Eseguo la logica dei filtri
    manageFilters();

    //Rimuovo il # dagli elementi "riga"
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
            var elementToScrollID = e.target.getAttribute('href');
            scrollTo(document.querySelector(elementToScrollID));
        });
    });
});