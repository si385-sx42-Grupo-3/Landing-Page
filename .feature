Feature: Registro de vendedor

    Scenario: El vendedor se registra en la aplicación
    Given el vendedor no se encuentra registrado y selecciona la opción de crear cuenta
    When rellena sus datos requeridos y hace click en "Aceptar"
    Then El sistema registra al vendedor y muestra la pestaña principal
    
    Scenario: El vendedor no rellena toda la información requerida
    Given el vendedor no ingresa todos los datos necesarios
    When haga click en el botón "Aceptar"
    Then mostrará una alerta indicando que complete los datos restantes

    Examples:
    | Nombre         | Contraseña| Correo             | Status |
    | Diego Ampuero  | Gjsam13fa | uxxxxxx.upc.edu.pe |True    |
    | Diego Ampuero  |           | uxxxxxx.upc.edu.pe |False   |

Feature: Comparar productos

    Scenario: El cliente escribe el nombre de dos productos
    Given el cliente ingresa a la seccion "Comparar productos"
    When escriba los nombres de dos productos
    Then se muestra las dos mejores caracteristicas de cada producto

    Scenario: El cliente coloca el nombre de un producto
    Given el cliente ingresa a la seccion "Comparar productos"
    When escriba los nombres de un solo producto
    Then se mostrará las caracteristicas de un producto y la otra sección en blanco

    Scenario: El cliente no coloca el nombre de ningún producto
    Given el cliente ingresa a la seccion "Comparar productos"
    When no escriba el nombre de ningún producto
    Then se le advertirá que debe escribir el nombre de dos productos

    Examples:
    | Producto 1 | Producto 2 |                           Output                          |
    | RTX 3060   | GTX 1650   |Caracteristicas de producto 1|Caracteristicas de producto 2|
    | RTX 3060   |            |Caracteristicas de producto 1|                             |
    |            |            |         Aviso:Ingrese el nombre de dos productos          |

Feature: Modelos de publicidad

    Scenario: El vendedor registra los datos de la publicidad
    Given el vendedor se encuentra en la sección "Mis anuncios"
    When seleccione la opción "Crear modelo" y complete los datos requeridos
    Then guarda la información y muestra el modelo

    Scenario: El vendedor registra de manera incompleta los datos de la publicidad
    Given el vendedor se encuentra en la sección "Mis anuncios"
    When seleccione la opción "Crear modelo" y no complete los datos requeridos
    Then le aparecerá un aviso que tiene que completar los datos requeridos

    Scenario: Visualizar publicidad de lugares de venta
    Given ingresa a los modelos de publicidad 
    When seleccione la plantilla de su preferencia
    Then lo dirigirá a la pestaña para realizar el pago por publicidad

    Examples:
    | Producto  |  Precio  |  Output   |
    | Intel I7  |  S/300   |  Guardado |
    | Intel I7  |          | Aviso:Completar datos faltantes |

    |Apartado Afiliados| Plantilla | Output |
    |       True       |   Click   | Apartado de pago |

Feature: Productos relacionados

    Scenario: Sección de producto
    Given el cliente desea ver productos para comparar con el producto en pantalla
    When se diriga a la parte inferior de la aplicación
    Then se mostrarás productos relacionados y se podrán comparar

Feature: Búsqueda de componentes para su PC 


    Scenario: Escribe el nombre del producto.
    Given el nombre del producto existe
    When introduzca el nombre del componente y de click a "Buscar"
    Then se mostrará los resultados del componente de los diversos distribiudores y tiendas con su precio

    Scenario: Escribe el nombre de componente inexistente
    Given el nombre del producto no existe
    When introduzca el nombre incorrecto y de click a "Buscar"
    Then se notificará que el nombre no es correcto y pedirá ingresar otro nombre

    Scenario: No se encontró el producto buscado
    Given el cliente no encontró el producto deseado en la busqueda
    When de click en "Ver productos similares"
    Then se mostrará productos con características similares al inicial
     
    Scenario: Nueva busqueda
    Given el cliente se encuentra en el apoartado de un producto específico
    When de click en "Buscar"
    Then podrá ingresar un nuevo nombre de producto

    Examples:
        | Barra de busqueda | Output |
        |    NVIDIA 3080    | Lista de busqueda           | 
        |    NVIDIA 5343    | Aviso:Ingresar otro nombre  | 
        |    NVIDIA 3090TI  | Lista de producto similares |

        | Apartado de producto | Buscar | Output |
        |         True         | Click  | Pestaña de búsqueda|

Feature: Administrar notificaciones

    Scenario: Activar notificación de un producto específico
    Given el producto existe y no tiene stock o descuentos
    When Active el botón de "Recordatorio"
    Then se notificará cuando el producto este disponible o su precio se reduzca

    Examples:
        | Botón         | Input | Output    |
        | Recordatorio  | Click | Activado  |

Feature: Vender producto 

    Scenario: Vender producto nuevo de segunda mano
    Given El producto se encuentra en buenas condiciones
    When escriba la descripción del producto
    Then se preguntará si el producto es nuevo o de segunda mano y en que estado se encuentra

    Scenario: Visualizar producto más vendidos
    Given el vendedor se encuentra en el apartado de Afiliados
    When de click en "Productos vendidos"
    Then lo dirigirá a otro apartado con la lista de sus productos más vendidos

    Examples:
        | Estado del producto | Output            | 
        |        Nuevo        |                   | 
        |     Segunda mano    | Especificar estado|

        | Apartado Afiliados | Productos vendidos | Output | 
        |        True        |        Click       | Lista de productos|

Feature: Redirección a la página del vendedor

    Scenario: Selección del componente a comprar
    Given se realizó correctamente el proceso de selección del producto
    When de click a "Comprar"
    Then redirigirá añl cliente a la página web del vendedor para efectuar la compra
    
    Examples:
        | Botón    |              Output             | 
        | Comprar  | www.compusmart.com/NVIDIA 3080  | 

Feature: Reseñas de productos

    Scenario: El cliente visualiza un producto de interés
    Given el cliente desea conocer más sobre el producto
    When haga click en "Ver reseñas"
    Then se mostrarás los comentarios de personas que posean el producto

    Scenario: El cliente puede responder a las reseñas
    Given que el cliente puede ver los comentarios de otros clientes
    When de click en "Responder"
    Then podrá responder el comentario seleccionado y dar su opinión

    Scenario: Escribir reseñas sobre productos
    Given el cliente puede ver el aartado de reseñas
    When de click en "Ver reseñas"
    Then puede usar el botón "Escribir reseña" y luego publicarla

    Examples:
        | Botón "Ver reseñas" | Output               |
        |        Click        | Lista de comentarios |

        |Botón "Responder"|Output|
        |      Click      |Despliegue de cuadro de texto para comentar|

        | Botón "Ver reseñas" |  Botón "Escribir reseña" | Output|
        |        Click        |           Click          | Despliegue de cuadro de texto |
        
Feature: Visualizar información de producto

    Scenario: Visualizar características específicas del producto
    Given el cliente busca y selecciona un producto
    When de click en "Ver más"
    Then se mostrarán las características más técnicas del producto seleccionado

    Scenario: Visualizar imágenes del producto
    Given el cliente busca y selecciona un producto
    When de click en la imagen principal del producto
    Then se mostrarán más imagenes del mismo producto

    Examples:
        | Producto | Ver más | Output |
        |   click  |  click  | Lista de características|

        | Producto | Imagen del producto | Output |
        |   click  |         click       | Album de imagenes|

Feature: Información de la aplicación

    Scenario: El cliente desea conocer sobre nuestra aplicación
    Given el cliente quiere ver la misión y visión de nuestra aplicación
    When de click en "Acerca de" en la pantalla de inicio
    Then lo redirigirá a nuestro Landing page 

    Examples:
        |    Botón   | Output                | 
        |  Acerca de | Msotrar Landing page  | 

Feature: Promocionar productos

    Scenario: Ingresa al apartado de afiliados
    Given el vendedor hace click en "Agregar producto"
    When ingrese las caracteristicas del producto e imágenes
    Then hará click en "Publicar"

    Scenario: No ingresa los datos requeridos del producto
    Given los datos no son suficientes para publicar el producto
    When de click en "Publicar"
    Then le avisará que rellene los datos restantes

    Scenario: Editar datos de productos promocionados
    Given el vendedor se encuentra en el apartado de afiliados
    When seleccione un producto promocionado y de click en "Editar"
    Then lo dirigirá al formulario donde visualizará los datos del producto y podrá editarlos

    Scenario: Eliminar productos promocionados
    Given el vendedor se encuentra en el apartado de Edición de publicidad
    When de click en "Eliminar publicidad"
    Then la publicidad será borrada de la página y no se mostrará a los clientes

    Examples:
        | Agregar productos | Datos requeridos | Publicar|
        |       Click       |        True      |  Click  |

        | Agregar productos | Datos requeridos | Publicar| Output |
        |       Click       |       False      |  Click  |  Aviso | 

        | Afiliados | Editar | Output |
        |   Click   | Click  | Formulario con datos del producto | 

        | Afiliados | Editar | Eliminar publicidad | Output |
        |   Click   | Click  |        Click        | Borrar publicación|


