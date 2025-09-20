# 🚀 Guía de Inicio Rápido - PineScript

## 🎯 ¿Qué es PineScript?

PineScript es el lenguaje de programación propietario de TradingView, diseñado específicamente para crear:
- 📊 **Indicadores técnicos personalizados**
- 🎯 **Estrategias de trading automatizadas**
- 📢 **Sistemas de alertas**
- 🤖 **Herramientas de análisis avanzado**

## ⚡ Primeros Pasos (5 minutos)

### 1️⃣ Acceder al Editor Pine
1. Ve a [TradingView](https://www.tradingview.com)
2. Abre cualquier gráfico
3. Haz clic en **"Pine Editor"** (pestaña inferior)
4. ¡Ya puedes comenzar a programar!

### 2️⃣ Tu Primer Indicador
Copia y pega este código en el editor:

```pinescript
//@version=6
indicator("Mi Primer Indicador", overlay=true)

// Parámetro configurable
longitud = input.int(20, title="Período SMA", minval=1)

// Cálculo de la media móvil
sma = ta.sma(close, longitud)

// Mostrar en el gráfico
plot(sma, title="SMA", color=color.blue, linewidth=2)
```

### 3️⃣ Guardar y Aplicar
1. Haz clic en **"Guardar"**
2. Dale un nombre a tu script
3. Haz clic en **"Añadir al gráfico"**
4. ¡Verás tu indicador funcionando!

## 📚 Conceptos Básicos Esenciales

### 🔧 Estructura de un Script
```pinescript
//@version=6                    // ← Versión de PineScript
indicator("Nombre")             // ← Tipo de script
                               
// Variables y cálculos
variable = valor

// Visualización
plot(variable)
```

### 📊 Tipos de Scripts
| Tipo | Propósito | Ejemplo |
|------|-----------|---------|
| `indicator()` | Mostrar datos en gráfico | RSI, MACD, SMA |
| `strategy()` | Backtesting de estrategias | Compra/Venta automatizada |

### 🎛 Variables Principales
```pinescript
close    // Precio de cierre
open     // Precio de apertura
high     // Precio máximo
low      // Precio mínimo
volume   // Volumen
```

### 🧮 Funciones Técnicas Comunes
```pinescript
ta.sma(source, length)     // Media móvil simple
ta.ema(source, length)     // Media móvil exponencial
ta.rsi(source, length)     // RSI
ta.macd(source, fast, slow, signal)  // MACD
```

## 🎨 Personalización Visual

### 🌈 Colores
```pinescript
plot(sma, color=color.blue)        // Azul
plot(sma, color=color.red)         // Rojo
plot(sma, color=#FF5733)           // Código hexadecimal
plot(sma, color=color.new(color.blue, 50))  // Azul transparente
```

### 📏 Estilos de Línea
```pinescript
plot(sma, linewidth=1)             // Línea fina
plot(sma, linewidth=3)             // Línea gruesa
plot(sma, style=plot.style_line)   // Línea continua
plot(sma, style=plot.style_circles) // Círculos
```

## 🎯 Ejemplo Práctico: RSI Personalizado

```pinescript
//@version=6
indicator("RSI Personalizado", shorttitle="RSI Custom")

// Parámetros
rsi_periodo = input.int(14, "Período RSI", minval=1)
sobreventa = input.int(30, "Nivel Sobreventa")
sobrecompra = input.int(70, "Nivel Sobrecompra")

// Cálculo
rsi = ta.rsi(close, rsi_periodo)

// Visualización
plot(rsi, "RSI", color=color.blue, linewidth=2)
hline(sobreventa, "Sobreventa", color=color.green, linestyle=hline.style_dashed)
hline(sobrecompra, "Sobrecompra", color=color.red, linestyle=hline.style_dashed)
hline(50, "Línea Media", color=color.gray)

// Coloreado de fondo
bgcolor(rsi > sobrecompra ? color.new(color.red, 90) : 
        rsi < sobreventa ? color.new(color.green, 90) : na)
```

## 📖 Siguientes Pasos

### 🎓 Aprendizaje Progresivo
1. **Principiante**: [Curso Básico Gratuito](../resources/courses/free-courses.md)
2. **Intermedio**: [Ejemplos de Estrategias](../code-examples/strategies/)
3. **Avanzado**: [Automatización y Bots](../automation/)

### 💻 Recursos Recomendados
- 📚 [Documentación Oficial v6](./official-documentation/v6/)
- 🎯 [Templates Listos para Usar](../code-examples/templates/)
- 👥 [Unirse a Comunidades](../resources/communities/)

### 🛠 Herramientas Útiles
- **Pineify**: Editor visual sin código
- **VSCode Extension**: Para desarrollo offline
- **PineCoders**: Recursos de la comunidad

## ❓ Preguntas Frecuentes

### ❗ **¿Necesito experiencia programando?**
No. PineScript está diseñado para traders sin experiencia técnica.

### ❗ **¿Es gratuito?**
Sí, el editor Pine y las funciones básicas son 100% gratuitas.

### ❗ **¿Puedo automatizar operaciones reales?**
PineScript permite backtesting. Para trading real necesitas integraciones externas.

### ❗ **¿Funciona en dispositivos móviles?**
El editor funciona mejor en escritorio, pero puedes ver indicadores en móvil.

## 🚀 ¡Comienza Ahora!

### Desafío de 30 Minutos
1. ✅ Crea tu primer indicador SMA
2. ✅ Modifica colores y estilos
3. ✅ Añade parámetros configurables
4. ✅ Comparte en la comunidad

### 🎁 Bonus: Script Completo para Copiar
```pinescript
//@version=6
indicator("Pack Principiante", overlay=true)

// Parámetros
sma_corta = input.int(10, "SMA Corta")
sma_larga = input.int(20, "SMA Larga")
mostrar_cruces = input.bool(true, "Mostrar Cruces")

// Cálculos
sma_10 = ta.sma(close, sma_corta)
sma_20 = ta.sma(close, sma_larga)

// Detección de cruces
cruce_alcista = ta.crossover(sma_10, sma_20)
cruce_bajista = ta.crossunder(sma_10, sma_20)

// Visualización
plot(sma_10, "SMA Corta", color=color.blue, linewidth=2)
plot(sma_20, "SMA Larga", color=color.red, linewidth=2)

// Señales
if mostrar_cruces
    plotshape(cruce_alcista, style=shape.triangleup, 
              location=location.belowbar, color=color.green, size=size.small)
    plotshape(cruce_bajista, style=shape.triangledown, 
              location=location.abovebar, color=color.red, size=size.small)

// Alertas
alertcondition(cruce_alcista, title="Cruce Alcista", message="SMA cruce alcista detectado")
alertcondition(cruce_bajista, title="Cruce Bajista", message="SMA cruce bajista detectado")
```

---

**🎯 ¡Copia este código y comienza a experimentar!**

[⬅️ Volver al inicio](../README.md) | [➡️ Documentación Completa](./official-documentation/)
