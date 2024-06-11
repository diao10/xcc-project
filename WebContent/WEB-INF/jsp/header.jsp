<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	 <div class="main-header-wrap">
     <header class="main-header js-main-header js-mmenu-fixed">
      <div class="container main-header-container clearfix">
       <ul class="secondary-nav">
        <li class="secondary-nav__item secondary-nav__item--more-margin secondary-nav__item--newsletter ">
	        <a class="secondary-nav__item__link-icon " href="${pageContext.request.contextPath}/message/selMessage.do">
		         <svg class="icon-svg">
			         <title>站内信</title>
			         <use xlink:href="#icon-newsletter" />
		         </svg>
		         <span class="secondary-nav__item__tooltip" aria-hidden="true">站内信</span>
	        </a>
	        <span id="unread" style="color: red">
	        	<c:if test="${messageCount!=0}">${messageCount}</c:if>
	        </span>
        </li>
        <li class="secondary-nav__item secondary-nav__item--more-margin ">
            <a class="secondary-nav__item__link" href="${pageContext.request.contextPath}/view/memInfo.html">${memLogin.memName}</a>
        </li>
       </ul>
       <a class="main-header__logo" href="${pageContext.request.contextPath}/view/memMain.html">
	       <img class="main-header__logo__img main-header__logo__img--big" width="80" height="80" alt="" src="${pageContext.request.contextPath }/dist/img/new_tyyy_logo.png">
	       <img class="main-header__logo__img main-header__logo__img--small" width="75" height="14" alt="" src="${pageContext.request.contextPath }/dist/img/new_tyyy_logo_z.png">
       </a>
       <nav class="main-nav">
       <ul role="menu">
	       <li class="main-nav__item js-main-nav-item main-nav__item--proyectos " role="menuitem">
	           <a class="main-nav__link js-main-nav-link" href="${pageContext.request.contextPath}/MemHealth/selMemHealthAll.do" data-subnav="proyectos">
	               <span class="main-nav__link__text">健康信息</span>
	           </a>
	       </li>
           <li class="main-nav__item js-main-nav-item main-nav__item--recursos " role="menuitem">
               <a class="main-nav__link js-main-nav-link" href="${pageContext.request.contextPath}/theme/selThemeAll.do" data-subnav="recursos">
                   <span class="main-nav__link__text">客户留言</span>
               </a>
       	   </li>
           <li class="main-nav__item js-main-nav-item main-nav__item--empresa " role="menuitem">
               <a class="main-nav__link js-main-nav-link" href="${pageContext.request.contextPath}/view/memInfo.html" data-subnav="empresa">
                   <span class="main-nav__link__text">个人信息</span>
               </a>
           </li>
           <li class="main-nav__item js-main-nav-item main-nav__item--noticias " role="menuitem">
               <a class="main-nav__link js-main-nav-link" href="${pageContext.request.contextPath}/view/memSign.html" data-subnav="noticias">
                   <span class="main-nav__link__text">会员功能</span>
               </a>
           </li>
       </ul>
       </nav>
      </div>
      <div class="main-subnav js-main-subnav"><!-- Add class is-active to change state -->
      <div class="main-subnav-section main-subnav-section--muebles has-photo js-main-subnav-section js-main-subnav-section-muebles"><!-- Add class is-active to change state -->
      
        </div>
        <div class="main-subnav-section main-subnav-section--proyectos js-main-subnav-section js-main-subnav-section-proyectos"><!-- Add class is-active to change state -->
        <div class="container">
        	<ul class="main-subnav__nav text-center clearfix">
	            <li class="main-subnav__item">
	                <a class="main-subnav__item__link" href="${pageContext.request.contextPath}/MemHealth/selMemHealthAll.do">
	                    <svg class="main-subnav__item__icon icon-svg icon-svg--fill" style="fill: #9e9e9e">
	                        <title>Oficinas</title>
	                        <use xlink:href="#icon-nav-proyectos-oficinas" />
	                    </svg>
	                    <div class="clearfix"></div>
	                    <span class="main-subnav__item__title"><svg class="icon-svg main-subnav__item__arrow icon-svg--fill" width="14" height="11" viewBox="0 0 14 11" xmlns="http://www.w3.org/2000/svg"><path d="M12.125 5.416H.06v1h11.91l-3.807 3.47.674.74 5.184-4.728L8.855.73l-.707.707 3.978 3.98z" fill-rule="evenodd"/></svg>会员健康信息</span>
	                </a>
	            </li>
	            <li class="main-subnav__item">
	                <a class="main-subnav__item__link" href="${pageContext.request.contextPath}/MemHealth/selMemHealthAll.do">
	                    <svg class="main-subnav__item__icon icon-svg icon-svg--fill" style="fill: #ff9800">
	                        <title>Auditorios</title>
	                        <use xlink:href="#icon-nav-proyectos-auditorios" />
	                    </svg>
	                    <div class="clearfix"></div>
	                    <span class="main-subnav__item__title"><svg class="icon-svg main-subnav__item__arrow icon-svg--fill" width="14" height="11" viewBox="0 0 14 11" xmlns="http://www.w3.org/2000/svg"><path d="M12.125 5.416H.06v1h11.91l-3.807 3.47.674.74 5.184-4.728L8.855.73l-.707.707 3.978 3.98z" fill-rule="evenodd"/></svg>家属健康信息</span>
	                </a>
	            </li>
	            <li class="main-subnav__item">
	                <a class="main-subnav__item__link" href="https://www.actiu.com/es/proyectos/institucional">
	                    <svg class="main-subnav__item__icon icon-svg icon-svg--fill" style="fill: #4db6ac">
	                        <title>Institucional</title>
	                        <use xlink:href="#icon-nav-proyectos-institucional" />
	                    </svg>
	                    <div class="clearfix"></div>
	                    <span class="main-subnav__item__title"><svg class="icon-svg main-subnav__item__arrow icon-svg--fill" width="14" height="11" viewBox="0 0 14 11" xmlns="http://www.w3.org/2000/svg"><path d="" fill-rule="evenodd"/></svg>诊断医院</span>
	                </a>
	            </li>
	            <li class="main-subnav__item">
	                <a class="main-subnav__item__link" href="https://www.actiu.com/es/proyectos/sanidad">
	                    <svg class="main-subnav__item__icon icon-svg icon-svg--fill" style="fill: #e57373">
	                        <title>Sanidad</title>
	                        <use xlink:href="#icon-nav-proyectos-sanidad" />
	                    </svg>
	                    <div class="clearfix"></div>
	                    <span class="main-subnav__item__title"><svg class="icon-svg main-subnav__item__arrow icon-svg--fill" width="14" height="11" viewBox="0 0 14 11" xmlns="http://www.w3.org/2000/svg"><path d="" fill-rule="evenodd"/></svg>诊断信息</span>
	                </a>
	            </li>
	            <li class="main-subnav__item">
	                <a class="main-subnav__item__link" href="https://www.actiu.com/es/proyectos/educacion">
	                    <svg class="main-subnav__item__icon icon-svg icon-svg--fill" style="fill: #8d6e63">
	                        <title>Educación</title>
	                        <use xlink:href="#icon-nav-proyectos-educacion" />
	                    </svg>
	                    <div class="clearfix"></div>
	                    <span class="main-subnav__item__title"><svg class="icon-svg main-subnav__item__arrow icon-svg--fill" width="14" height="11" viewBox="0 0 14 11" xmlns="http://www.w3.org/2000/svg"><path d="M12.125 5.416H.06v1h11.91l-3.807 3.47.674.74 5.184-4.728L8.855.73l-.707.707 3.978 3.98z" fill-rule="evenodd"/></svg>诊断意见</span>
	                </a>
	            </li>
	        	<li class="main-subnav__item">
	                <a class="main-subnav__item__link" href="https://www.actiu.com/es/proyectos/hosteleria">
	                    <svg class="main-subnav__item__icon icon-svg icon-svg--fill" style="fill: #ba68c8">
	                        <title>Hostelería</title>
	                        <use xlink:href="#icon-nav-proyectos-hosteleria" />
	                    </svg>
	                    <div class="clearfix"></div>
	                    <span class="main-subnav__item__title"><svg class="icon-svg main-subnav__item__arrow icon-svg--fill" width="14" height="11" viewBox="0 0 14 11" xmlns="http://www.w3.org/2000/svg"><path d="M12.125 5.416H.06v1h11.91l-3.807 3.47.674.74 5.184-4.728L8.855.73l-.707.707 3.978 3.98z" fill-rule="evenodd"/></svg>用药情况</span>
	                </a>
	            </li>
            </ul>
        </div>
    	</div>
      	<div class="main-subnav-section main-subnav-section--recursos has-photo js-main-subnav-section js-main-subnav-section-recursos"><!-- Add class is-active to change state -->
        <div class="container">
	       	<ul class="main-subnav__nav clearfix">
	            <li class="main-subnav__item">
	                <a class="main-subnav__item__link" href="">
	                    <svg class="main-subnav__item__icon icon-svg icon-svg--fill" style="fill: #998489;">
	                        <title>Arquitectura</title>
	                        <use xlink:href="#icon-nav-recursos-arquitectura" />
	                    </svg>
	                    <span class="main-subnav__item__title"><svg class="icon-svg main-subnav__item__arrow icon-svg--fill" width="14" height="11" viewBox="0 0 14 11" ><path d="" fill-rule="evenodd"/></svg>发表留言</span>
	                </a>
	            </li>
	            <li class="main-subnav__item">
	                <a class="main-subnav__item__link" href="https://www.actiu.com/es/muebles/muebles-videos">
	                    <svg class="main-subnav__item__icon icon-svg icon-svg--fill" style="fill: #7c75c8;">
	                        <title>Vídeos</title>
	                        <use xlink:href="#icon-nav-recursos-videos" />
	                    </svg>
	                    <div class="clearfix">  <div class="search-backdrop js-search-backdrop"></div>
	                    <span class="main-subnav__item__title"><svg class="icon-svg main-subnav__item__arrow icon-svg--fill" width="14" height="11" viewBox="0 0 14 11" xmlns="http://www.w3.org/2000/svg"><path d="M12.125 5.416H.06v1h11.91l-3.807 3.47.674.74 5.184-4.728L8.855.73l-.707.707 3.978 3.98z" fill-rule="evenodd"/></svg>留言记录</span>
	                </a>
	            </li>
	       	</ul>
        </div>
        </div>
        <div class="main-subnav-section main-subnav-section--empresa js-main-subnav-section js-main-subnav-section-empresa"><!-- Add class is-active to change state -->
        <div class="container">
            <ul class="main-subnav__nav clearfix">
                <li class="main-subnav__item">
                    <a class="main-subnav__item__link" href="https://www.actiu.com/es/empresa/empleo">
                        <svg class="main-subnav__item__icon icon-svg icon-svg--fill" style="fill: #64b5f6;">
                            <title>Empleo</title>
                            <use xlink:href="#icon-nav-empresa-empleo" />
                        </svg>
                        <div class="clearfix"></div>
                        <span class="main-subnav__item__title"><svg class="icon-svg main-subnav__item__arrow icon-svg--fill" width="14" height="11" viewBox="0 0 14 11" xmlns="http://www.w3.org/2000/svg"><path d="M12.125 5.416H.06v1h11.91l-3.807 3.47.674.74 5.184-4.728L8.855.73l-.707.707 3.978 3.98z" fill-rule="evenodd"/></svg>查看个人信息</span>
                    </a>
                </li>
                <li class="main-subnav__item">
                    <a class="main-subnav__item__link" href="https://www.actiu.com/es/empresa/parque-tecnologico">
                        <svg class="main-subnav__item__icon icon-svg icon-svg--fill" style="fill: #bdc260;">
                            <title>Parque<br>tecnológico</title>
                            <use xlink:href="#icon-nav-empresa-parque" />
                        </svg>
                        <div class="clearfix"></div>
                        <span class="main-subnav__item__title"><svg class="icon-svg main-subnav__item__arrow icon-svg--fill" width="14" height="11" viewBox="0 0 14 11" xmlns="http://www.w3.org/2000/svg"><path d="M12.125 5.416H.06v1h11.91l-3.807 3.47.674.74 5.184-4.728L8.855.73l-.707.707 3.978 3.98z" fill-rule="evenodd"/></svg>查看家属</span>
                    </a>
                </li>
                <li class="main-subnav__item">
                    <a class="main-subnav__item__link" href="https://www.actiu.com/es/empresa/siempre-en-movimiento">
                        <svg class="main-subnav__item__icon icon-svg icon-svg--fill" style="fill: #e57474;">
                                    <title>Campañas</title>
                                    <use xlink:href="#icon-nav-empresa-campanas" />
                                </svg>
                                <div class="clearfix"></div>
                                <span class="main-subnav__item__title"><svg class="icon-svg main-subnav__item__arrow icon-svg--fill" width="14" height="11" viewBox="0 0 14 11" xmlns="http://www.w3.org/2000/svg"><path d="M12.125 5.416H.06v1h11.91l-3.807 3.47.674.74 5.184-4.728L8.855.73l-.707.707 3.978 3.98z" fill-rule="evenodd"/></svg>查看下线</span>
                            </a>
                 </li>
				 <li class="main-subnav__item">
                     <a class="main-subnav__item__link" href="https://www.actiu.com/es/muebles/disenyadores">
                         <svg class="main-subnav__item__icon icon-svg icon-svg--fill" style="fill: #dc2342">
                             <title>Diseñadores</title>
                             <use xlink:href="#icon-nav-muebles-disenadores" />
                         </svg>
                         <div class="clearfix"></div>
                         <span class="main-subnav__item__title"><svg class="icon-svg main-subnav__item__arrow icon-svg--fill" width="14" height="11" viewBox="0 0 14 11" xmlns="http://www.w3.org/2000/svg"><path d="M12.125 5.416H.06v1h11.91l-3.807 3.47.674.74 5.184-4.728L8.855.73l-.707.707 3.978 3.98z" fill-rule="evenodd"/></svg>查看职阶</span>
                     </a>
                 </li>
            </ul>
        </div>
        </div>
        <div class="main-subnav-section main-subnav-section--noticias js-main-subnav-section js-main-subnav-section-noticias"><!-- Add class is-active to change state -->
        <div class="container">
	        <ul class="main-subnav__nav clearfix">
	            <li class="main-subnav__item">
	                <a class="main-subnav__item__link" href="https://www.actiu.com/es/actualidad">
	                    <svg class="main-subnav__item__icon icon-svg icon-svg--stroke-fill" style="fill: #4db6ac; stroke: #4db6ac;">
	                        <title>Noticias</title>
	                        <use xlink:href="#icon-nav-noticias-actualidad" />
	                    </svg>
	                    <div class="clearfix"></div>
	                    <span class="main-subnav__item__title"><svg class="icon-svg main-subnav__item__arrow icon-svg--fill" width="14" height="11" viewBox="0 0 14 11" xmlns="http://www.w3.org/2000/svg"><path d="M12.125 5.416H.06v1h11.91l-3.807 3.47.674.74 5.184-4.728L8.855.73l-.707.707 3.978 3.98z" fill-rule="evenodd"/></svg>会员等级</span>
	                </a>
	            </li>
	            <li class="main-subnav__item">
	                <a class="main-subnav__item__link" href="https://www.actiu.com/es/actualidad/prensa">
	                    <svg class="main-subnav__item__icon icon-svg icon-svg--fill" style="fill: #607d8b;">
	                        <title>Aparición en prensa</title>
	                        <use xlink:href="#icon-nav-noticias-prensa" />
                        </svg>
                        <div class="clearfix"></div>
                        <span class="main-subnav__item__title"><svg class="icon-svg main-subnav__item__arrow icon-svg--fill" width="14" height="11" viewBox="0 0 14 11" xmlns="http://www.w3.org/2000/svg"><path d="M12.125 5.416H.06v1h11.91l-3.807 3.47.674.74 5.184-4.728L8.855.73l-.707.707 3.978 3.98z" fill-rule="evenodd"/></svg>点数查询</span>
                     </a>
                </li>
			    <li class="main-subnav__item">
                     <a class="main-subnav__item__link" href="https://www.actiu.com/es/empresa/showrooms-actiu">
                        <svg class="main-subnav__item__icon icon-svg icon-svg--fill" style="fill: #969696;">
	                        <title>Showrooms</title>
	                        <use xlink:href="#icon-nav-empresa-showrooms" />
	                    </svg>
	                    <div class="clearfix"></div>
	                    <span class="main-subnav__item__title"><svg class="icon-svg main-subnav__item__arrow icon-svg--fill" width="14" height="11" viewBox="0 0 14 11" xmlns="http://www.w3.org/2000/svg"><path d="M12.125 5.416H.06v1h11.91l-3.807 3.47.674.74 5.184-4.728L8.855.73l-.707.707 3.978 3.98z" fill-rule="evenodd"/></svg>签到情况</span>
	                </a>
	            </li>
	        </ul>
          </div>
          </div>
          </div>
    </header>
   </div>
</body>
</html>