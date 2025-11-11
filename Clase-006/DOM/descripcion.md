# Descripcion del ejemplo

Kevin Penafiel

El navegador lee el HTML y construye esta estructura de arbol de forma interna:
```less
Document
 └── html
     └── body
         ├── h1#title ("Hello, world!")
         ├── button#changeBtn ("Change text")
         └── script

```
---

## Que sucede cuando clickeas el boton

1. JavaScript encuentra los nodos (`<h1>` y `<button>`) en el DOM.
2. Escucha el evento `click` en el boton.
3. Cuando se cickea, modifica el nodo **text node** dentro de `<h1>`.
4. El navegador actualiza la pagina visible — instantaneamente, sin refrescar.
