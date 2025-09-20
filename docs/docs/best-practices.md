# 🏆 Mejores Prácticas en PineScript

*Guía completa para escribir código PineScript profesional, eficiente y mantenible*

---

## 📋 Tabla de Contenidos

1. [🎯 Estructura y Organización](#-estructura-y-organización)
2. [📝 Nomenclatura y Convenciones](#-nomenclatura-y-convenciones)
3. [⚡ Optimización y Rendimiento](#-optimización-y-rendimiento)
4. [🛡 Gestión de Errores](#-gestión-de-errores)
5. [📊 Visualización Efectiva](#-visualización-efectiva)
6. [🎛 Parámetros de Usuario](#-parámetros-de-usuario)
7. [🔒 Seguridad y Validación](#-seguridad-y-validación)
8. [📚 Documentación](#-documentación)
9. [🚫 Errores Comunes a Evitar](#-errores-comunes-a-evitar)
10. [✅ Checklist de Calidad](#-checklist-de-calidad)

---

## 🎯 Estructura y Organización

### 📐 Estructura Estándar Recomendada

```pinescript
//@version=6
indicator("Nombre del Indicador", shorttitle="ABREV", overlay=true)

// ══════════════════════════════════════════════════════════════════════
// 📋 CONFIGURACIÓN Y PARÁMETROS
// ══════════════════════════════════════════════════════════════════════

// Parámetros principales
length = input.int(20, "Período", minval=1, maxval=500)
source = input.source(close, "Fuente de Datos")

// Configuración visual
color_line = input.color(color.blue, "Color de Línea")
line_width = input.int(2, "Grosor de Línea", minval=1, maxval=5)

// ══════════════════════════════════════════════════════════════════════
// 🧮 FUNCIONES AUXILIARES
// ══════════════════════════════════════════════════════════════════════

// Función para cálculos personalizados
calcularIndicador(src, len) =>
    ta.sma(src, len)

// Función para validación de datos
esValido(valor) =>
    not na(valor) and valor > 0

// ══════════════════════════════════════════════════════════════════════
// 📊 CÁLCULOS PRINCIPALES
// ══════════════════════════════════════════════════════════════════════

// Cálculo del indicador principal
indicador_principal = calcularIndicador(source, length)

// Cálculos secundarios
señal = ta.ema(indicador_principal, 9)

// ══════════════════════════════════════════════════════════════════════
// 🎨 VISUALIZACIÓN
// ══════════════════════════════════════════════════════════════════════

// Plot principal
plot(indicador_principal, "Indicador", color=color_line, linewidth=line_width)

// Plot secundario
plot(señal, "Señal", color=color.orange, linewidth=1)

// ══════════════════════════════════════════════════════════════════════
// 📢 ALERTAS
// ══════════════════════════════════════════════════════════════════════

// Condiciones de alerta
cruce_alcista = ta.crossover(indicador_principal, señal)
cruce_bajista = ta.crossunder(indicador_principal, señal)

// Configuración de alertas
alertcondition(cruce_alcista, title="Cruce Alcista", message="{{ticker}} - Cruce alcista detectado")
alertcondition(cruce_bajista, title="Cruce Bajista", message="{{ticker}} - Cruce bajista detectado")
```

### 🗂 Separación por Bloques

#### ✅ **BIEN - Código Organizado**
```pinescript
// PARÁMETROS
periodo = input.int(14)
fuente = input.source(close)

// CÁLCULOS
rsi_valor = ta.rsi(fuente, periodo)
media = ta.sma(rsi_valor, 5)

// VISUALIZACIÓN
plot(rsi_valor, "RSI")
plot(media, "Media RSI")
```

#### ❌ **MAL - Código Desordenado**
```pinescript
periodo = input.int(14)
rsi_valor = ta.rsi(close, periodo)
plot(rsi_valor, "RSI")
fuente = input.source(close)
media = ta.sma(rsi_valor, 5)
plot(media, "Media RSI")
```

---

## 📝 Nomenclatura y Convenciones

### 🏷 Convenciones de Nombres

#### Variables
```pinescript
// ✅ BIEN - snake_case para variables
precio_cierre = close
media_movil_rapida = ta.ema(close, 12)
nivel_sobrecompra = 70

// ✅ BIEN - Nombres descriptivos
rsi_periodo = input.int(14, "Período RSI")
color_linea_alcista = input.color(color.green, "Color Alcista")

// ❌ MAL - Nombres poco descriptivos
p = 14
c = color.green
x = ta.rsi(close, 14)
```

#### Funciones
```pinescript
// ✅ BIEN - camelCase para funciones personalizadas
calcularVolatilidad(src, len) =>
    ta.stdev(src, len)

detectarDivergencia(precio, oscilador) =>
    // Lógica de detección
    true

// ✅ BIEN - Nombres que describen la acción
esNivelAlcanzado(valor, nivel) =>
    valor >= nivel
```

#### Constantes
```pinescript
// ✅ BIEN - MAYÚSCULAS para constantes
NIVEL_SOBRECOMPRA = 70
NIVEL_SOBREVENTA = 30
COLOR_ALCISTA = color.green
COLOR_BAJISTA = color.red
```

### 📋 Prefijos Recomendados

| Prefijo | Uso | Ejemplo |
|---------|-----|---------|
| `is_` | Valores booleanos | `is_alcista`, `is_valido` |
| `has_` | Verificaciones | `has_volumen`, `has_datos` |
| `calc_` | Funciones de cálculo | `calc_volatilidad()` |
| `get_` | Funciones que retornan valores | `get_precio_medio()` |
| `draw_` | Funciones de visualización | `draw_linea_tendencia()` |

---

## ⚡ Optimización y Rendimiento

### 🚀 Técnicas de Optimización

#### 1. **Usar Variables Locales**
```pinescript
// ✅ BIEN - Variable local (más eficiente)
calcularPromedio(src, len) =>
    suma = 0.0
    for i = 0 to len - 1
        suma := suma + src[i]
    suma / len

// ❌ MAL - Recalcular en cada uso
// ta.sma(close, 20) + ta.sma(close, 20) // Cálculo duplicado
```

#### 2. **Evitar Cálculos Innecesarios**
```pinescript
// ✅ BIEN - Calcular una vez, usar múltiples veces
precio_medio = (high + low) / 2
condicion_a = precio_medio > close
condicion_b = precio_medio < open

// ❌ MAL - Calcular múltiples veces
condicion_a = (high + low) / 2 > close
condicion_b = (high + low) / 2 < open
```

#### 3. **Usar Operadores Eficientes**
```pinescript
// ✅ BIEN - Operadores nativos de Pine
cruce_alcista = ta.crossover(fast_ma, slow_ma)

// ❌ MAL - Lógica manual innecesaria
cruce_alcista = fast_ma > slow_ma and fast_ma[1] <= slow_ma[1]
```

### 📊 Gestión de Series de Tiempo

#### Acceso Eficiente a Datos Históricos
```pinescript
// ✅ BIEN - Acceso directo
precio_anterior = close[1]
maxima_reciente = ta.highest(high, 10)

// ❌ MAL - Bucles innecesarios para datos disponibles
var float precio_anterior = na
precio_anterior := close[1]
```

---

## 🛡 Gestión de Errores

### 🔍 Validación de Datos

#### Verificación de Valores NA
```pinescript
// ✅ BIEN - Verificación robusta
calcularIndicador(src) =>
    if na(src)
        runtime.error("Error: Fuente de datos inválida")
        na
    else
        ta.sma(src, 20)

// ✅ BIEN - Valor por defecto
valor_seguro = na(close) ? 0.0 : close
```

#### Validación de Parámetros
```pinescript
// ✅ BIEN - Validación en inputs
periodo = input.int(14, "Período", minval=1, maxval=500, 
                   tooltip="Período debe estar entre 1 y 500")

// ✅ BIEN - Validación adicional
if periodo < 1 or periodo > 500
    runtime.error("Período fuera de rango válido (1-500)")
```

### ⚠️ Manejo de Casos Extremos

```pinescript
// ✅ BIEN - Manejo de división por cero
calcularRatio(a, b) =>
    if b == 0
        na
    else
        a / b

// ✅ BIEN - Manejo de valores extremos
normalizarValor(valor, min_val, max_val) =>
    if valor < min_val
        min_val
    else if valor > max_val
        max_val
    else
        valor
```

---

## 📊 Visualización Efectiva

### 🎨 Mejores Prácticas Visuales

#### Colores Consistentes
```pinescript
// ✅ BIEN - Paleta de colores coherente
COLOR_ALCISTA = #26a69a    // Verde
COLOR_BAJISTA = #ef5350    // Rojo
COLOR_NEUTRO = #78909c     // Gris
COLOR_FONDO = #f5f5f5      // Gris claro

// Uso consistente
plot(linea_alcista, color=COLOR_ALCISTA)
plot(linea_bajista, color=COLOR_BAJISTA)
```

#### Transparencias Apropiadas
```pinescript
// ✅ BIEN - Transparencias para no sobrecargar
area_alcista = close > open
bgcolor(area_alcista ? color.new(COLOR_ALCISTA, 85) : na)

// Líneas secundarias más sutiles
plot(media_secundaria, color=color.new(color.gray, 50))
```

#### Información Clara en Tooltips
```pinescript
// ✅ BIEN - Tooltips informativos
periodo_rsi = input.int(14, "Período RSI", 
                       tooltip="Número de períodos para calcular RSI. Valores típicos: 14 (estándar), 21 (menos sensible)")
```

### 📏 Escalado y Ubicación

```pinescript
// ✅ BIEN - Indicadores en panel separado cuando es apropiado
//@version=6
indicator("RSI", shorttitle="RSI")  // No overlay=true para osciladores

// ✅ BIEN - Niveles de referencia claros
hline(70, "Sobrecompra", color=color.red, linestyle=hline.style_dashed)
hline(30, "Sobreventa", color=color.green, linestyle=hline.style_dashed)
hline(50, "Línea Media", color=color.gray)
```

---

## 🎛 Parámetros de Usuario

### 🔧 Inputs Bien Diseñados

#### Organización por Grupos
```pinescript
// ✅ BIEN - Agrupación lógica de parámetros

// === CONFIGURACIÓN PRINCIPAL ===
periodo_principal = input.int(20, "Período Principal", minval=1, group="Configuración Principal")
fuente_datos = input.source(close, "Fuente de Datos", group="Configuración Principal")

// === CONFIGURACIÓN VISUAL ===
mostrar_señales = input.bool(true, "Mostrar Señales", group="Visualización")
color_linea = input.color(color.blue, "Color de Línea", group="Visualización")
grosor_linea = input.int(2, "Grosor de Línea", minval=1, maxval=5, group="Visualización")

// === ALERTAS ===
activar_alertas = input.bool(true, "Activar Alertas", group="Alertas")
```

#### Valores por Defecto Sensatos
```pinescript
// ✅ BIEN - Valores estándar de la industria
rsi_periodo = input.int(14, "Período RSI")      // Estándar 14
bb_periodo = input.int(20, "Período BB")        // Estándar 20
bb_desviacion = input.float(2.0, "Desviación BB") // Estándar 2.0

// ✅ BIEN - Rangos apropiados
volumen_filtro = input.float(1.5, "Filtro Volumen", minval=0.1, maxval=10.0, step=0.1)
```

---

## 🔒 Seguridad y Validación

### 🛡 Validación de Entrada

```pinescript
// ✅ BIEN - Validación completa
validarParametros(periodo, fuente) =>
    errores = array.new<string>()
    
    if periodo < 1 or periodo > 500
        array.push(errores, "Período debe estar entre 1 y 500")
    
    if na(fuente)
        array.push(errores, "Fuente de datos no válida")
    
    if array.size(errores) > 0
        mensaje = "Errores encontrados:\n" + str.join(array.to_string(errores), "\n")
        runtime.error(mensaje)
    
    true
```

### 🔐 Prevención de Errores Runtime

```pinescript
// ✅ BIEN - Verificación antes de cálculos críticos
calcularDivergencia(precio, oscilador, lookback) =>
    if bar_index < lookback or na(precio) or na(oscilador)
        false
    else
        // Lógica de cálculo segura
        precio > precio[lookback] and oscilador < oscilador[lookback]
```

---

## 📚 Documentación

### 📝 Comentarios Efectivos

#### Comentarios de Sección
```pinescript
// ═══════════════════════════════════════════════════════════════════════════════
// 📊 CÁLCULO DE MEDIAS MÓVILES
// Calcula diferentes tipos de medias móviles según la configuración del usuario
// ═══════════════════════════════════════════════════════════════════════════════
```

#### Comentarios Inline
```pinescript
// Cálculo de volatilidad usando desviación estándar
volatilidad = ta.stdev(close, 20) * 100    // Multiplicado por 100 para porcentaje

// Detección de breakout con confirmación de volumen
breakout_alcista = close > ta.highest(high, 20)[1] and volume > ta.sma(volume, 10) * 1.5
```

#### Documentación de Funciones
```pinescript
// @function Detecta divergencias entre precio y oscilador
// @param precio_serie Serie de precios para analizar
// @param oscilador_serie Serie del oscilador técnico
// @param periodo_lookback Número de barras hacia atrás para buscar
// @returns bool Verdadero si se detecta divergencia bajista
detectarDivergenciaBajista(precio_serie, oscilador_serie, periodo_lookback) =>
    // Implementación aquí
    false
```

---

## 🚫 Errores Comunes a Evitar

### ❌ **Error 1: Repainting**
```pinescript
// ❌ MAL - Puede repaint
señal_compra = ta.crossover(close, ta.sma(close, 20))

// ✅ BIEN - Sin repaint, usa precio confirmado
señal_compra = ta.crossover(close[1], ta.sma(close, 20)[1])
```

### ❌ **Error 2: Lookahead Bias**
```pinescript
// ❌ MAL - Usa información futura
max_dia = ta.highest(high, 24)  // En timeframe intradiario

// ✅ BIEN - Solo información pasada confirmada
max_sesion_anterior = ta.highest(high[1], 20)
```

### ❌ **Error 3: Sobrecarga Visual**
```pinescript
// ❌ MAL - Demasiados elementos
plot(sma_5, color=color.red)
plot(sma_10, color=color.blue)
plot(sma_15, color=color.green)
plot(sma_20, color=color.orange)
plot(ema_5, color=color.purple)
// ... más plots

// ✅ BIEN - Información esencial
plot(sma_rapida, "SMA Rápida", color=color.blue)
plot(sma_lenta, "SMA Lenta", color=color.red)
// Solo lo necesario
```

### ❌ **Error 4: Hardcoding de Valores**
```pinescript
// ❌ MAL - Valores fijos
if close > 50 and volume > 1000000

// ✅ BIEN - Valores relativos
if close > ta.sma(close, 200) and volume > ta.sma(volume, 20) * 2
```

---

## ✅ Checklist de Calidad

### 📋 **Antes de Publicar**

#### ✅ **Código**
- [ ] ¿El código está bien estructurado y comentado?
- [ ] ¿Los nombres de variables son descriptivos?
- [ ] ¿Se validan todos los parámetros de entrada?
- [ ] ¿Se manejan casos de error y valores NA?
- [ ] ¿El código es eficiente (sin cálculos innecesarios)?

#### ✅ **Funcionalidad**
- [ ] ¿El indicador funciona en diferentes timeframes?
- [ ] ¿Se ha probado con diferentes símbolos?
- [ ] ¿Las alertas funcionan correctamente?
- [ ] ¿No hay problemas de repainting?
- [ ] ¿Los valores por defecto son apropiados?

#### ✅ **Visualización**
- [ ] ¿Los colores son apropiados y consistentes?
- [ ] ¿La información es clara y no está sobrecargada?
- [ ] ¿Los tooltips son informativos?
- [ ] ¿El indicador se muestra en el panel correcto?

#### ✅ **Documentación**
- [ ] ¿Hay descripción clara del propósito?
- [ ] ¿Se explican todos los parámetros?
- [ ] ¿Hay ejemplos de uso?
- [ ] ¿Se mencionan limitaciones conocidas?

### 🎯 **Niveles de Calidad**

#### 🥉 **Básico**
- Código funcional
- Parámetros básicos
- Visualización simple

#### 🥈 **Intermedio**
- Código bien estructurado
- Validación de parámetros
- Tooltips informativos
- Manejo básico de errores

#### 🥇 **Avanzado**
- Código optimizado y documentado
- Validación completa
- Múltiples opciones de visualización
- Manejo robusto de errores
- Casos de prueba extensivos

#### 🏆 **Profesional**
- Código ejemplar siguiendo todas las mejores prácticas
- Documentación completa
- Soporte para múltiples casos de uso
- Testing exhaustivo
- Contribución a la comunidad

---

## 🔗 Recursos Adicionales

### 📚 **Documentación Oficial**
- [Pine Script User Manual v6](../official-documentation/v6/)
- [Pine Script Reference](../api-reference/v6/)
- [Style Guide TradingView](https://www.tradingview.com/pine-script-docs/writing/style-guide/)

### 🛠 **Herramientas**
- [Pine Script Linter](../resources/tools/linting.md)
- [Code Formatter](../resources/tools/formatting.md)
- [Testing Framework](../resources/tools/testing.md)

### 👥 **Comunidad**
- [Discord PineScript](https://discord.me/pinescriptcommunity)
- [PineCoders FAQ](https://www.pinecoders.com/faq_and_code/)
- [TradingView Scripts](https://www.tradingview.com/scripts/)

---

<div align="center">

### 🎯 **"La calidad no es un acto, sino un hábito"** - Aristóteles

**Escribir código PineScript de calidad es una inversión en tu futuro como trader-programador**

</div>

---

[⬅️ Volver al inicio](../README.md) | [📖 Documentación](./official-documentation/) | [💻 Ejemplos](../code-examples/)
