<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, java.text.SimpleDateFormat" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>JSP vs EJS - Guía Completa</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            min-height: 100vh;
            padding: 20px;
            line-height: 1.6;
        }
        .container {
            max-width: 1200px;
            margin: 0 auto;
            background: white;
            border-radius: 15px;
            box-shadow: 0 20px 60px rgba(0,0,0,0.3);
            overflow: hidden;
        }
        header {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            padding: 40px;
            text-align: center;
        }
        header h1 {
            font-size: 2.5em;
            margin-bottom: 10px;
        }
        .nav {
            background: #f8f9fa;
            padding: 15px;
            display: flex;
            justify-content: center;
            gap: 20px;
            flex-wrap: wrap;
            border-bottom: 3px solid #667eea;
        }
        .nav button {
            background: white;
            color: #667eea;
            padding: 10px 25px;
            border: 2px solid #667eea;
            border-radius: 8px;
            cursor: pointer;
            font-size: 14px;
            font-weight: 600;
            transition: all 0.3s;
        }
        .nav button:hover, .nav button.active {
            background: #667eea;
            color: white;
            transform: translateY(-2px);
        }
        .content {
            padding: 40px;
        }
        .section {
            display: none;
            animation: fadeIn 0.5s;
        }
        .section.active {
            display: block;
        }
        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }
        h2 {
            color: #667eea;
            margin-bottom: 20px;
            font-size: 2em;
            border-bottom: 3px solid #667eea;
            padding-bottom: 10px;
        }
        h3 {
            color: #764ba2;
            margin-top: 25px;
            margin-bottom: 15px;
            font-size: 1.5em;
        }
        .card {
            background: #f8f9fa;
            padding: 25px;
            border-radius: 10px;
            margin-bottom: 20px;
            border-left: 5px solid #667eea;
        }
        .comparison-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 20px;
            margin: 20px 0;
        }
        .comparison-card {
            background: white;
            padding: 25px;
            border-radius: 10px;
            border: 2px solid #e9ecef;
            transition: all 0.3s;
        }
        .comparison-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 25px rgba(0,0,0,0.1);
        }
        .comparison-card h4 {
            color: #667eea;
            margin-bottom: 15px;
            font-size: 1.3em;
        }
        .pros-cons {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 20px;
            margin: 20px 0;
        }
        .pros, .cons {
            background: white;
            padding: 25px;
            border-radius: 10px;
            border: 2px solid #e9ecef;
        }
        .pros {
            border-left: 5px solid #28a745;
        }
        .cons {
            border-left: 5px solid #dc3545;
        }
        .pros h3 {
            color: #28a745;
        }
        .cons h3 {
            color: #dc3545;
        }
        ul {
            margin-left: 20px;
            margin-top: 10px;
        }
        li {
            margin-bottom: 10px;
            color: #495057;
        }
        .code-example {
            background: #2d2d2d;
            color: #f8f8f2;
            padding: 20px;
            border-radius: 8px;
            overflow-x: auto;
            margin: 15px 0;
            font-family: 'Courier New', monospace;
            font-size: 14px;
        }
        .highlight {
            background: #fff3cd;
            padding: 3px 6px;
            border-radius: 3px;
            font-weight: 600;
        }
        .demo-section {
            background: linear-gradient(135deg, #e3f2fd 0%, #f3e5f5 100%);
            padding: 30px;
            border-radius: 10px;
            margin-top: 30px;
        }
        .demo-form {
            background: white;
            padding: 25px;
            border-radius: 10px;
            margin-top: 20px;
        }
        .form-group {
            margin-bottom: 15px;
        }
        label {
            display: block;
            margin-bottom: 5px;
            font-weight: 600;
            color: #495057;
        }
        input[type="text"], textarea, select {
            width: 100%;
            padding: 12px;
            border: 2px solid #dee2e6;
            border-radius: 8px;
            font-size: 14px;
        }
        button[type="submit"] {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            padding: 12px 30px;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            font-size: 16px;
            font-weight: 600;
            transition: transform 0.2s;
        }
        button[type="submit"]:hover {
            transform: translateY(-2px);
        }
        .result-box {
            background: #d4edda;
            border: 2px solid #28a745;
            padding: 20px;
            border-radius: 8px;
            margin-top: 20px;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin: 20px 0;
        }
        th, td {
            padding: 15px;
            text-align: left;
            border-bottom: 1px solid #dee2e6;
        }
        th {
            background: #667eea;
            color: white;
            font-weight: 600;
        }
        tr:hover {
            background: #f8f9fa;
        }
        .tag {
            display: inline-block;
            padding: 5px 10px;
            border-radius: 5px;
            font-size: 0.85em;
            font-weight: 600;
            margin-right: 5px;
        }
        .tag-jsp {
            background: #667eea;
            color: white;
        }
        .tag-ejs {
            background: #90ee90;
            color: #2d5016;
        }
        @media (max-width: 768px) {
            .pros-cons {
                grid-template-columns: 1fr;
            }
            .comparison-grid {
                grid-template-columns: 1fr;
            }
        }
    </style>
</head>
<body>
    <%
        // Manejo del estado de navegación
        String currentSection = request.getParameter("section");
        if (currentSection == null || currentSection.isEmpty()) {
            currentSection = "intro";
        }
        
        // Sistema de demostración interactivo
        String demoResult = null;
        if ("demo".equals(request.getParameter("action"))) {
            String nombre = request.getParameter("nombre");
            String lenguaje = request.getParameter("lenguaje");
            
            if (nombre != null && !nombre.trim().isEmpty()) {
                demoResult = "¡Hola " + nombre + "! Has elegido aprender " + lenguaje + ". ";
                demoResult += "Esta página fue generada dinámicamente usando JSP en el servidor. ";
                demoResult += "Hora del servidor: " + new SimpleDateFormat("HH:mm:ss").format(new Date());
            }
        }
        
        // Contador de sesión
        Integer visitCount = (Integer) session.getAttribute("visitCount");
        if (visitCount == null) {
            visitCount = 1;
        } else {
            visitCount++;
        }
        session.setAttribute("visitCount", visitCount);
    %>
    
    <div class="container">
        <header>
            <h1>🚀 JavaServer Pages (JSP) vs EJS</h1>
            <p>Guía completa para entender las diferencias, ventajas y cuándo usar cada tecnología</p>
            <p style="margin-top: 10px; font-size: 0.9em;">
                📊 Visitas en esta sesión: <%= visitCount %> | 
                🕐 Hora actual: <%= new SimpleDateFormat("HH:mm:ss").format(new Date()) %>
            </p>
        </header>
        
        <div class="nav">
            <button onclick="showSection('intro')" class="<%= "intro".equals(currentSection) ? "active" : "" %>">
                Introducción
            </button>
            <button onclick="showSection('comparison')" class="<%= "comparison".equals(currentSection) ? "active" : "" %>">
                Comparación
            </button>
            <button onclick="showSection('advantages')" class="<%= "advantages".equals(currentSection) ? "active" : "" %>">
                Ventajas y Desventajas
            </button>
            <button onclick="showSection('when-use')" class="<%= "when-use".equals(currentSection) ? "active" : "" %>">
                ¿Cuándo usar JSP?
            </button>
            <button onclick="showSection('demo')" class="<%= "demo".equals(currentSection) ? "active" : "" %>">
                Demo Interactiva
            </button>
        </div>
        
        <div class="content">
            <!-- Sección Introducción -->
            <div id="intro" class="section <%= "intro".equals(currentSection) ? "active" : "" %>">
                <h2>¿Qué es JSP?</h2>
                
                <div class="card">
                    <p><strong>JavaServer Pages (JSP)</strong> es una tecnología de servidor creada por Sun Microsystems (ahora Oracle) que permite crear páginas web dinámicas usando Java. JSP se ejecuta en el servidor y genera HTML que se envía al navegador del cliente.</p>
                </div>
                
                <h3>🔧 Características Principales de JSP</h3>
                <div class="comparison-grid">
                    <div class="comparison-card">
                        <h4>☕ Basado en Java</h4>
                        <p>Utiliza todo el poder del lenguaje Java y su ecosistema de bibliotecas empresariales.</p>
                    </div>
                    <div class="comparison-card">
                        <h4>🏢 Orientado a Empresas</h4>
                        <p>Diseñado para aplicaciones de nivel empresarial con alta seguridad y escalabilidad.</p>
                    </div>
                    <div class="comparison-card">
                        <h4>🔄 Compilado</h4>
                        <p>Las páginas JSP se compilan a servlets de Java para máximo rendimiento.</p>
                    </div>
                    <div class="comparison-card">
                        <h4>🎯 Fuertemente Tipado</h4>
                        <p>Aprovecha el sistema de tipos de Java para detectar errores en tiempo de compilación.</p>
                    </div>
                </div>
                
                <h3>Ejemplo de Código JSP</h3>
                <div class="code-example">
&lt;%@ page language="java" contentType="text/html" %&gt;
&lt;%@ page import="java.util.Date" %&gt;

&lt;%
    String usuario = "Carlos";
    Date fechaActual = new Date();
%&gt;

&lt;h1&gt;Hola &lt;%= usuario %&gt;&lt;/h1&gt;
&lt;p&gt;Fecha: &lt;%= fechaActual %&gt;&lt;/p&gt;
                </div>
            </div>
            
            <!-- Sección Comparación -->
            <div id="comparison" class="section <%= "comparison".equals(currentSection) ? "active" : "" %>">
                <h2>JSP vs EJS: Diferencias Clave</h2>
                
                <div class="card">
                    <p><strong>EJS (Embedded JavaScript)</strong> es un motor de plantillas para Node.js que permite generar HTML usando JavaScript. Aunque ambos permiten crear contenido dinámico, son tecnologías muy diferentes.</p>
                </div>
                
                <h3>📊 Tabla Comparativa</h3>
                <table>
                    <tr>
                        <th>Característica</th>
                        <th><span class="tag tag-jsp">JSP</span></th>
                        <th><span class="tag tag-ejs">EJS</span></th>
                    </tr>
                    <tr>
                        <td><strong>Lenguaje Base</strong></td>
                        <td>Java</td>
                        <td>JavaScript (Node.js)</td>
                    </tr>
                    <tr>
                        <td><strong>Ejecución</strong></td>
                        <td>Compilado a bytecode</td>
                        <td>Interpretado</td>
                    </tr>
                    <tr>
                        <td><strong>Servidor</strong></td>
                        <td>Tomcat, JBoss, WebLogic</td>
                        <td>Node.js + Express</td>
                    </tr>
                    <tr>
                        <td><strong>Tipado</strong></td>
                        <td>Fuertemente tipado</td>
                        <td>Débilmente tipado</td>
                    </tr>
                    <tr>
                        <td><strong>Curva de Aprendizaje</strong></td>
                        <td>Alta (requiere conocer Java)</td>
                        <td>Baja (JavaScript es más simple)</td>
                    </tr>
                    <tr>
                        <td><strong>Rendimiento</strong></td>
                        <td>Muy alto (código compilado)</td>
                        <td>Bueno (interpretado)</td>
                    </tr>
                    <tr>
                        <td><strong>Ecosistema</strong></td>
                        <td>Java EE / Jakarta EE</td>
                        <td>npm / Node.js</td>
                    </tr>
                    <tr>
                        <td><strong>Uso Principal</strong></td>
                        <td>Aplicaciones empresariales</td>
                        <td>Aplicaciones web modernas</td>
                    </tr>
                </table>
                
                <h3>💻 Comparación de Sintaxis</h3>
                
                <div class="comparison-grid">
                    <div class="comparison-card">
                        <h4><span class="tag tag-jsp">JSP</span> Sintaxis</h4>
                        <div class="code-example">
&lt;% 
  String nombre = "María";
  int edad = 25;
%&gt;

&lt;p&gt;Nombre: &lt;%= nombre %&gt;&lt;/p&gt;
&lt;p&gt;Edad: &lt;%= edad %&gt;&lt;/p&gt;

&lt;% if (edad >= 18) { %&gt;
  &lt;p&gt;Mayor de edad&lt;/p&gt;
&lt;% } %&gt;
                        </div>
                    </div>
                    
                    <div class="comparison-card">
                        <h4><span class="tag tag-ejs">EJS</span> Sintaxis</h4>
                        <div class="code-example">
&lt;% 
  let nombre = "María";
  let edad = 25;
%&gt;

&lt;p&gt;Nombre: &lt;%= nombre %&gt;&lt;/p&gt;
&lt;p&gt;Edad: &lt;%= edad %&gt;&lt;/p&gt;

&lt;% if (edad >= 18) { %&gt;
  &lt;p&gt;Mayor de edad&lt;/p&gt;
&lt;% } %&gt;
                        </div>
                    </div>
                </div>
                
                <div class="card">
                    <p><strong>Nota:</strong> Como puedes ver, la sintaxis es muy similar, pero la diferencia está en el lenguaje subyacente (Java vs JavaScript) y en cómo se ejecutan en el servidor.</p>
                </div>
            </div>
            
            <!-- Sección Ventajas y Desventajas -->
            <div id="advantages" class="section <%= "advantages".equals(currentSection) ? "active" : "" %>">
                <h2>✅ Ventajas y ❌ Desventajas de JSP</h2>
                
                <div class="pros-cons">
                    <div class="pros">
                        <h3>✅ Ventajas de JSP</h3>
                        <ul>
                            <li><strong>Alto Rendimiento:</strong> Las páginas se compilan a bytecode de Java, lo que resulta en ejecución muy rápida</li>
                            <li><strong>Escalabilidad:</strong> Ideal para aplicaciones grandes con millones de usuarios</li>
                            <li><strong>Seguridad Robusta:</strong> Java tiene características de seguridad integradas y maduras</li>
                            <li><strong>Ecosistema Empresarial:</strong> Acceso a miles de bibliotecas Java probadas en producción</li>
                            <li><strong>Multithreading:</strong> Manejo nativo y eficiente de múltiples hilos</li>
                            <li><strong>Integración con Java EE:</strong> Se integra perfectamente con EJB, JPA, Spring, etc.</li>
                            <li><strong>Tipado Fuerte:</strong> Detecta errores en tiempo de compilación</li>
                            <li><strong>Madurez:</strong> Tecnología probada durante más de 20 años</li>
                            <li><strong>Soporte Corporativo:</strong> Respaldo de grandes empresas como Oracle, IBM, Red Hat</li>
                            <li><strong>Herramientas:</strong> IDEs potentes como IntelliJ IDEA, Eclipse, NetBeans</li>
                        </ul>
                    </div>
                    
                    <div class="cons">
                        <h3>❌ Desventajas de JSP</h3>
                        <ul>
                            <li><strong>Curva de Aprendizaje Alta:</strong> Requiere conocer Java y conceptos de programación orientada a objetos</li>
                            <li><strong>Configuración Compleja:</strong> Necesita servidor de aplicaciones como Tomcat, configuración XML, etc.</li>
                            <li><strong>Desarrollo Más Lento:</strong> Ciclo de compilación puede ser más lento que lenguajes interpretados</li>
                            <li><strong>Verbosidad:</strong> Java tiende a requerir más líneas de código que JavaScript</li>
                            <li><strong>Menos Moderno:</strong> No es tan popular en startups y proyectos nuevos</li>
                            <li><strong>Recursos del Servidor:</strong> Requiere más memoria RAM que aplicaciones Node.js</li>
                            <li><strong>Tiempo de Inicio:</strong> Las aplicaciones Java pueden tardar más en iniciar</li>
                            <li><strong>Menor Comunidad Activa:</strong> Comparado con tecnologías JavaScript modernas</li>
                            <li><strong>Costo de Hosting:</strong> Los servidores Java suelen ser más caros</li>
                            <li><strong>Menor Flexibilidad:</strong> El tipado fuerte puede ser restrictivo para prototipos rápidos</li>
                        </ul>
                    </div>
                </div>
                
                <h3>📊 Comparación de Ventajas: JSP vs EJS</h3>
                <div class="card">
                    <p><strong>JSP es mejor cuando:</strong></p>
                    <ul>
                        <li>Necesitas máximo rendimiento y escalabilidad</li>
                        <li>Estás construyendo aplicaciones empresariales grandes</li>
                        <li>Requieres seguridad de nivel bancario</li>
                        <li>Ya tienes infraestructura Java</li>
                        <li>Tu equipo conoce Java</li>
                    </ul>
                </div>
                
                <div class="card">
                    <p><strong>EJS es mejor cuando:</strong></p>
                    <ul>
                        <li>Quieres desarrollo rápido y prototipado ágil</li>
                        <li>Tu equipo conoce JavaScript</li>
                        <li>Necesitas menor consumo de recursos</li>
                        <li>Buscas una curva de aprendizaje más suave</li>
                        <li>Construyes aplicaciones pequeñas a medianas</li>
                    </ul>
                </div>
            </div>
            
            <!-- Sección Cuándo Usar -->
            <div id="when-use" class="section <%= "when-use".equals(currentSection) ? "active" : "" %>">
                <h2>🎯 ¿Cuándo Deberías Usar JSP?</h2>
                
                <h3>✅ Escenarios Ideales para JSP</h3>
                
                <div class="comparison-grid">
                    <div class="comparison-card">
                        <h4>🏦 Sector Bancario y Financiero</h4>
                        <p>Los bancos y entidades financieras prefieren JSP por su seguridad robusta, transacciones confiables y cumplimiento normativo.</p>
                    </div>
                    
                    <div class="comparison-card">
                        <h4>🏢 Aplicaciones Empresariales</h4>
                        <p>ERP, CRM y sistemas internos de grandes corporaciones que necesitan escalabilidad y estabilidad.</p>
                    </div>
                    
                    <div class="comparison-card">
                        <h4>🛒 E-commerce de Gran Escala</h4>
                        <p>Tiendas online con millones de productos y transacciones simultáneas (como Mercado Libre en sus inicios).</p>
                    </div>
                    
                    <div class="comparison-card">
                        <h4>🏥 Sistemas de Salud</h4>
                        <p>Hospitales y clínicas que manejan datos sensibles y requieren máxima seguridad y disponibilidad.</p>
                    </div>
                    
                    <div class="comparison-card">
                        <h4>📱 Telecomunicaciones</h4>
                        <p>Sistemas de facturación y gestión que procesan millones de registros diariamente.</p>
                    </div>
                    
                    <div class="comparison-card">
                        <h4>🎓 Plataformas Educativas</h4>
                        <p>Universidades con miles de estudiantes concurrentes y sistemas complejos de gestión académica.</p>
                    </div>
                </div>
                
                <h3>❌ Cuándo NO Usar JSP</h3>
                <div class="card">
                    <ul>
                        <li><strong>Proyectos Pequeños:</strong> Si solo necesitas un blog personal o sitio web simple</li>
                        <li><strong>Startups con MVP:</strong> Cuando necesitas validar una idea rápidamente</li>
                        <li><strong>Aplicaciones en Tiempo Real:</strong> Chat, gaming o streaming (Node.js es mejor)</li>
                        <li><strong>Equipo sin Experiencia Java:</strong> La curva de aprendizaje puede retrasar el proyecto</li>
                        <li><strong>Recursos Limitados:</strong> Si tu servidor tiene poca RAM o CPU</li>
                        <li><strong>APIs RESTful Simples:</strong> Frameworks como Express.js o Flask son más ligeros</li>
                    </ul>
                </div>
                
                <h3>🌎 Casos de Uso en Latinoamérica</h3>
                <div class="comparison-grid">
                    <div class="comparison-card">
                        <h4>🇲🇽 México</h4>
                        <p>Bancos como Banorte y BBVA México usan tecnología Java/JSP para sus plataformas de banca en línea.</p>
                    </div>
                    
                    <div class="comparison-card">
                        <h4>🇧🇷 Brasil</h4>
                        <p>Grandes retailers como Magazine Luiza utilizan Java para manejar su e-commerce de alto tráfico.</p>
                    </div>
                    
                    <div class="comparison-card">
                        <h4>🇦🇷 Argentina</h4>
                        <p>El sistema de facturación electrónica de AFIP se basa en tecnologías Java.</p>
                    </div>
                    
                    <div class="comparison-card">
                        <h4>🇨🇱 Chile</h4>
                        <p>Instituciones gubernamentales como ChileCompra usan Java para sus portales de licitaciones.</p>
                    </div>
                </div>
            </div>
            
            <!-- Sección Demo -->
            <div id="demo" class="section <%= "demo".equals(currentSection) ? "active" : "" %>">
                <h2>🎮 Demostración Interactiva de JSP</h2>
                
                <div class="card">
                    <p>Esta página está <strong>completamente construida con JSP</strong>. Todo el contenido que ves fue generado dinámicamente en el servidor usando Java. ¡Prueba la demostración a continuación!</p>
                </div>
                
                <div class="demo-section">
                    <h3>📝 Formulario Dinámico JSP</h3>
                    <p>Este formulario demuestra cómo JSP procesa datos en el servidor y genera respuestas dinámicas.</p>
                    
                    <div class="demo-form">
                        <form method="post" action="?section=demo">
                            <input type="hidden" name="action" value="demo">
                            
                            <div class="form-group">
                                <label for="nombre">👤 Tu Nombre:</label>
                                <input type="text" id="nombre" name="nombre" required placeholder="Ingresa tu nombre">
                            </div>
                            
                            <div class="form-group">
                                <label for="lenguaje">💻 ¿Qué quieres aprender?</label>
                                <select id="lenguaje" name="lenguaje">
                                    <option value="JSP">JavaServer Pages (JSP)</option>
                                    <option value="Java">Java</option>
                                    <option value="Spring Boot">Spring Boot</option>
                                    <option value="Jakarta EE">Jakarta EE</option>
                                </select>
                            </div>
                            
                            <button type="submit">Procesar en el Servidor JSP</button>
                        </form>
                        
                        <% if (demoResult != null) { %>
                            <div class="result-box">
                                <h4>✅ Respuesta del Servidor JSP:</h4>
                                <p><%= demoResult %></p>
                                <p><strong>Datos de la sesión:</strong></p>
                                <ul>
                                    <li>ID de Sesión: <%= session.getId().substring(0, 16) %>...</li>
                                    <li>Tiempo de creación: <%= new SimpleDateFormat("HH:mm:ss").format(new Date(session.getCreationTime())) %></li>
                                    <li>Visitas en esta sesión: <%= visitCount %></li>
                                </ul>
                            </div>
                        <% } %>
                    </div>
                </div>
                
                <h3>🔍 ¿Qué está pasando aquí?</h3>
                <div class="card">
                    <p>Cuando envías el formulario:</p>
                    <ol>
                        <li>Los datos se envían al <strong>servidor</strong> (no se procesan en el navegador)</li>
                        <li>JSP ejecuta código <strong>Java</strong> en el servidor</li>
                        <li>Se genera HTML dinámicamente basado en tus datos</li>
                        <li>El servidor envía la página HTML completa a tu navegador</li>
                        <li>La sesión se mantiene usando cookies (JSESSIONID)</li>
                    </ol>
                    <p><strong>Esto es diferente de EJS/JavaScript</strong> donde parte de la lógica puede ejecutarse en el cliente con JavaScript.</p>
                </div>
                
                <h3>💡 Características JSP Demostradas</h3>
                <div class="comparison-grid">
                    <div class="comparison-card">
                        <h4>🔄 Procesamiento en el Servidor</h4>
                        <p>Todo el código Java se ejecuta en el servidor antes de enviar HTML al cliente.</p>
                    </div>
                    
                    <div class="comparison-card">
                        <h4>📦 Gestión de Sesiones</h4>
                        <p>JSP maneja sesiones automáticamente con objetos HttpSession de Java.</p>
                    </div>
                    
                    <div class="comparison-card">
                        <h4>⏰ Acceso a APIs Java</h4>
                        <p>Puedes usar cualquier clase de Java, como SimpleDateFormat, Date, Collections, etc.</p>
                    </div>
                    
                    <div class="comparison-card">
                        <h4>🎯 Navegación con Estado</h4>
                        <p>El sistema mantiene el estado de navegación y contadores de visitas.</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    <script>
        function showSection(sectionId) {
            // Ocultar todas las secciones
            const sections = document.querySelectorAll('.section');
            sections.forEach(section => section.classList.remove('active'));
            
            // Mostrar la sección seleccionada
            document.getElementById(sectionId).classList.add('active');
            
            // Actualizar botones de navegación
            const buttons = document.querySelectorAll('.nav button');
            buttons.forEach(button => button.classList.remove('active'));
            event.target.classList.add('active');
            
            // Actualizar URL sin recargar la página
            const url = new URL(window.location);
            url.searchParams.set('section', sectionId);
            window.history.pushState({}, '', url);
        }
        
        // Manejar navegación del navegador (botones atrás/adelante)
        window.addEventListener('popstate', function() {
            const urlParams = new URLSearchParams(window.location.search);
            const section = urlParams.get('section') || 'intro';
            
            document.querySelectorAll('.section').forEach(s => s.classList.remove('active'));
            document.getElementById(section).classList.add('active');
            
            document.querySelectorAll('.nav button').forEach(b => b.classList.remove('active'));
            const activeButton = Array.from(document.querySelectorAll('.nav button'))
                .find(b => b.textContent.toLowerCase().includes(section));
            if (activeButton) activeButton.classList.add('active');
        });
    </script>
</body>
</html>