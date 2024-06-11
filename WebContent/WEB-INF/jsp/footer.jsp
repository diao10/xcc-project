<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	   <footer class="main-footer ">
	                <div class="container">
	                    <a href="${pageContext.request.contextPath }/view/memMain.html" class="main-footer__logo">
	                    	<img alt="" src="${pageContext.request.contextPath }/dist/img/new_tyyy_logo.png"> 
	                    </a>
						 <div class="row">
							<div class="main-footer__col main-footer__col--1 col-sm-3">
	                            <h4 class="main-footer__title">Productos</h4>
	                            <ul class="main-footer__links">
                                   <li class="main-footer__link"><a href="https://www.actiu.com/es/muebles/sillas-oficina">Sillas de oficina</a></li>
                                   <li class="main-footer__link"><a href="https://www.actiu.com/es/muebles/mesas">Mesas</a></li>
                                   <li class="main-footer__link"><a href="https://www.actiu.com/es/muebles/sillas-colectividades">Sillas de colectividades</a></li>
                                   <li class="main-footer__link"><a href="https://www.actiu.com/es/muebles/sillas-espera">Sillas de espera</a></li>
                                   <li class="main-footer__link"><a href="https://www.actiu.com/es/muebles/soft-seating">Soft seating</a></li>
	                            </ul>
		                    </div>
	                        <div class="main-footer__col main-footer__col--2 col-sm-3">
	                            <h4 class="main-footer__title">Más Actiu</h4>
	                            <ul class="main-footer__links">
	                                <!-- <li class="main-footer__link"><a href="#link_muebles_ambientes">Ambientes</a></li> -->
	                                <li class="main-footer__link"><a href="https://www.actiu.com/es/proyectos/">Proyectos</a></li>
	                                <li class="main-footer__link"><a href="https://www.actiu.com/es/empresa/">Empresa</a></li>
	                                <li class="main-footer__link"><a href="https://www.actiu.com/es/actualidad/">Actualidad</a></li>
	                                <li class="main-footer__link"><a href="https://www.actiu.com/es/arquitectura">Arquitectura</a></li>
	                            </ul>
	                        </div>
		                    <div class="main-footer__col main-footer__col--3 col-sm-3">
		                            <h4 class="main-footer__title">你妹</h4>
		                            <ul class="main-footer__links">
                                       <li class="main-footer__link"><a href="https://www.actiu.com/es/acerca-de/condiciones-generales-aviso-legal" title="Condiciones generales . Aviso legal" rel="nofollow">Condiciones generales . Aviso legal</a></li>
                                       <li class="main-footer__link"><a href="https://www.actiu.com/es/acerca-de/lopd-lssi" title="LOPD . LSSI" rel="nofollow">LOPD . LSSI</a></li>
                                       <li class="main-footer__link"><a href="https://www.actiu.com/es/acerca-de/Politica-de-calidad-y-medioambiente" title="Politica de Calidad y Medioambiente">Politica de Calidad y Medioambiente</a></li>
		                            </ul>
		                        </div>
		                        <%-- <div class="main-footer__col main-footer__col--4 col-sm-3">
		                           <h4 class="main-footer__title">Newsletter y redes sociales</h4>
		                                <div class="main-footer__newsletter">
		                                <div class="main-footer__newsletter__text">
		                                    <p>Manténgase informado de todas nuestras nuevas colecciones, noticias y eventos especiales a través de nuestra newsletter y nuestros perfiles en redes sociales.</p>
		                                </div>
		                               <form class="main-footer__newsletter__form clearfix" action="https://www.actiu.com/es/contacto/newsletter" accept-charset="utf-8" method="post" novalidate>
		                                    <div class="main-footer__newsletter__input-wrap">
		                                        <input type="hidden" id="desdeFuera" name="desdeFuera" value="1">
		                                        <input class="main-footer__newsletter__input form-control input-lg js-footer-newsletter" type="email" id="email" name="email" placeholder="¿Cuál es su email?">
		                                    </div>
		                                    <div class="main-footer__newsletter__btn-wrap">
		                                        <button class="main-footer__newsletter__btn btn btn-lg btn-lg-50 btn-block btn-maroon" title="Suscribirse al Newsletter"><svg class="icon-svg " width="13" height="24" viewBox="0 0 13 24" xmlns="http://www.w3.org/2000/svg"><path d="M1 23l10-11.238L1.424 1" stroke-width="2" fill="none" fill-rule="evenodd"/></svg></button>
		                                    </div>
		                                </form>
		                            </div>
		
		                            <div class="main-footer__social">
		                                <a class="main-footer__social__link main-footer__social__link--twitter" href="https://twitter.com/actiu" target="_blank" title="Actiu en Twitter" onclick="_gaq.push(['_trackPageview', 'http://twitter.com/#!/actiu']); estadisticas_actiu('%2Fdownload-file%2Fhttp%3A%2F%2Ftwitter.com%2F%23%21%2Factiu','-1'); "  ><svg class="icon-svg  icon-svg--fill" width="23" height="20" viewBox="0 0 23 20" xmlns="http://www.w3.org/2000/svg"><path d="M20.536 5.48l.012.606c0 6.194-4.722 13.337-13.35 13.337-2.648 0-5.124-.766-7.198-2.103.367.046.745.07 1.123.07 2.2 0 4.217-.756 5.822-2.013-2.052-.034-3.782-1.394-4.378-3.257.287.057.573.09.882.09.423 0 .836-.056 1.237-.17-2.154-.423-3.77-2.32-3.77-4.594V7.39c.63.353 1.364.56 2.13.58C1.788 7.138.964 5.698.964 4.075c0-.857.23-1.668.63-2.354 2.315 2.834 5.776 4.697 9.672 4.89-.08-.34-.115-.696-.115-1.06 0-2.596 2.098-4.687 4.688-4.687 1.352 0 2.578.56 3.426 1.474 1.077-.206 2.074-.594 2.99-1.143-.354 1.097-1.1 2.023-2.073 2.595.952-.104 1.857-.367 2.705-.733-.63.937-1.432 1.76-2.35 2.423" fill-rule="evenodd"/></svg></a>
		                                <a class="main-footer__social__link main-footer__social__link--facebook" href="https://www.facebook.com/actiubf" target="_blank" title="Actiu en Facebook" onclick="_gaq.push(['_trackPageview', 'http://www.facebook.com/actiubf']); estadisticas_actiu('%2Fdownload-file%2Fhttp%3A%2F%2Fwww.facebook.com%2Factiubf','-1'); "  ><svg class="icon-svg  icon-svg--fill" width="14" height="24" viewBox="0 0 14 24" xmlns="http://www.w3.org/2000/svg"><path d="M8.76 23.79V13.502h3.437V8.93H8.76V5.96c0-1.177.33-1.6 2.062-1.6h2.52V.726C12.966.67 11.5.93 9.975.93c-3.175 0-5.8 1.887-5.8 5.36v2.64H.738v4.573h3.438V23.79H8.76" fill-rule="evenodd"/></svg></a>
		                                <a class="main-footer__social__link main-footer__social__link--youtube" href="https://www.youtube.com/user/actiubf" target="_blank" title="Actiu en Youtube" onclick="_gaq.push(['_trackPageview', 'http://www.youtube.com/user/actiubf']); estadisticas_actiu('%2Fdownload-file%2Fhttp%3A%2F%2Fwww.youtube.com%2Fuser%2Factiubf','-1'); "  ><svg class="icon-svg  icon-svg--fill" width="24" height="17" viewBox="0 0 24 17" xmlns="http://www.w3.org/2000/svg"><path d="M14.68 8.543L9.26 11.41h.068V4.85l6.19 3.293-.838.4zm8.17-4.857s-.262-1.612-.95-2.32C21.03.44 20.055.43 19.608.383c-3.197-.24-8-.24-8-.24h-.01s-4.802 0-8.01.24C3.14.43 2.165.44 1.294 1.366.608 2.074.39 3.686.39 3.686S.16 5.57.16 7.47v1.77c0 1.886.23 3.783.23 3.783s.218 1.61.905 2.32c.87.926 2.017.89 2.52.994 1.835.183 7.783.24 7.783.24s4.813-.01 8.01-.25c.447-.058 1.42-.058 2.292-.984.688-.71.95-2.32.95-2.32s.23-1.897.23-3.783V7.47c0-1.9-.23-3.784-.23-3.784z"  fill-rule="evenodd"/></svg></a>
		                                <a class="main-footer__social__link main-footer__social__link--pinterest" href="https://www.pinterest.com/actiu/" target="_blank" title="Actiu en Pinterest" onclick="_gaq.push(['_trackPageview', 'http://www.pinterest.com/actiu/']); estadisticas_actiu('%2Fdownload-file%2Fhttp%3A%2F%2Fwww.pinterest.com%2Factiu%2F','-1'); "  ><svg class="icon-svg  icon-svg--fill" width="20" height="24" viewBox="0 0 20 24" xmlns="http://www.w3.org/2000/svg"><path d="M6.272 9.48c0-.983.253-1.817.768-2.49.516-.676 1.146-1.007 1.88-1.007.596 0 1.054.194 1.375.583.32.388.48.868.48 1.45 0 .367-.068.813-.205 1.327-.126.526-.31 1.13-.527 1.828-.23.7-.39 1.247-.482 1.647-.17.72-.033 1.337.414 1.852.447.513 1.03.776 1.765.776 1.282 0 2.325-.697 3.15-2.103.814-1.406 1.226-3.11 1.226-5.11 0-1.542-.504-2.787-1.524-3.747-1.008-.972-2.418-1.452-4.217-1.452-2.017 0-3.656.64-4.916 1.91C4.21 6.2 3.58 7.73 3.58 9.513c0 1.052.31 1.943.916 2.686.206.23.264.47.195.743-.056.206-.148.57-.274 1.097-.046.16-.138.274-.264.33-.126.07-.263.07-.424 0-.928-.376-1.638-1.027-2.108-1.964-.482-.926-.722-2-.722-3.212 0-.788.126-1.577.39-2.365.263-.79.664-1.556 1.203-2.287.55-.732 1.204-1.383 1.96-1.954.757-.573 1.685-1.03 2.774-1.373 1.1-.33 2.27-.503 3.53-.503 1.283 0 2.475.217 3.575.652 1.1.434 2.027 1.017 2.772 1.737.745.72 1.33 1.543 1.753 2.48.424.937.63 1.897.63 2.903 0 2.685-.687 4.914-2.074 6.663-1.385 1.76-3.173 2.64-5.362 2.64-.733 0-1.41-.173-2.04-.504-.64-.332-1.088-.732-1.34-1.2l-.963 3.737c-.275 1.05-.928 2.297-1.96 3.748h-.94c-.206-1.827-.17-3.347.127-4.536l1.776-7.394c-.287-.583-.436-1.303-.436-2.16" fill-rule="evenodd"/></svg></a>
		                                <a class="main-footer__social__link main-footer__social__link--rss" href="http://www.actiu.com/es/RSS" target="_blank" title="Noticias Actiu en formato RSS" onclick="_gaq.push(['_trackPageview', '<?php echo base_url_lang(); ?>RSS']); estadisticas_actiu('%2Fdownload-file%2F%3C%3Fphp+echo+base_url_lang%28%29%3B+%3F%3ERSS','-1'); "  ><svg class="icon-svg  icon-svg--fill" width="23" height="24" viewBox="0 0 23 24" xmlns="http://www.w3.org/2000/svg"><g fill-rule="evenodd"><path d="M6.148 20.51c0 1.68-1.364 3.04-3.05 3.04-1.683 0-3.047-1.36-3.047-3.04 0-1.67 1.365-3.03 3.05-3.03 1.684 0 3.048 1.36 3.048 3.03"/><path d="M.05 12.863c2.855 0 5.548 1.108 7.565 3.13 2.028 2.024 3.14 4.71 3.14 7.578h4.4c0-8.32-6.773-15.084-15.104-15.084v4.377"/><path d="M.05 5.09c10.19 0 18.474 8.3 18.474 18.48h4.4C22.925 10.967 12.658.715.052.715V5.09"/></g></svg></a>
		                                <a class="main-footer__social__link main-footer__social__link--linkedin" href="https://www.linkedin.com/company/actiu" target="_blank" title="Actiu en LinkedIn" onclick="_gaq.push(['_trackPageview', 'https://www.linkedin.com/company/actiu']); estadisticas_actiu('%2Fdownload-file%2Fhttps%3A%2F%2Fwww.linkedin.com%2Fcompany%2Factiu','-1'); "  ><svg class="icon-svg  icon-svg--fill" width="23" height="24" viewBox="0 0 23 24" xmlns="http://www.w3.org/2000/svg"><path d="M5.81 8.52v14.47c0 .147-.39.284-.515.41-.115.114-.253.17-.402.17H.815c-.162 0-.448-.056-.563-.17-.114-.126-.172-.263-.172-.41V8.52c0-.16.058-.65.172-.777.115-.114.4-.172.563-.172h4.078c.15 0 .63.06.745.173.115.126.172.617.172.777zm-.997-3.05c-.55.536-1.203.81-1.96.81-.767 0-1.42-.274-1.96-.81C.356 4.92.08 4.27.08 3.502c0-.777.275-1.43.814-1.977.54-.537 1.192-.812 1.96-.812.756 0 1.41.275 1.96.812.538.548.813 1.2.813 1.977 0 .766-.275 1.417-.814 1.966zm12.022 6.96c-.3-.367-.482-.55-1.238-.55-.974 0-1.926.286-2.326.87-.39.57-.584 1.36-.584 2.387v7.852c0 .147-.057.284-.172.41-.114.114.01.17-.16.17h-4.08c-.15 0 .115-.056 0-.17-.115-.126-.172-.263-.172-.41V8.52c0-.16.057-.65.172-.777.115-.114-.15-.172 0-.172h3.964c.15 0 .265.024.356.08.08.06.15.527.172.676l.045.297.014.377c1.03-.97 2.383-1.45 4.08-1.45 1.89 0 3.414.48 4.492 1.427 1.064.95 1.604 2.366 1.604 4.24v9.772c0 .147-.057.284-.172.41-.114.114-.286.17-.447.17H18.2c-.15 0-.64-.056-.756-.17-.115-.126-.172-.263-.172-.41v-8.824c0-.79-.15-1.36-.435-1.737z" fill-rule="evenodd"/></svg></a>
		                            </div>
		                        </div> --%>
		
		                    </div>
		
		                                        <div class="main-footer__copyright">
		                        Copyright 2016, <span class="main-footer__copyright__prominent">ACTIU Berbegal y Formas S.A.</span>
		                    </div>
		
		                </div>
		</footer>
            

</body>
</html>