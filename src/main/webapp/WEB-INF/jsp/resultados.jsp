<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<c:import url="componentesHTML/inicioHTML.jsp" />
<c:import url="componentesHTML/navBar-Iniciado.jsp" />
<c:import url="componentesHTML/ul-BarraDeportes.jsp" />
<h1 id="bets">Resultados de los Partidos</h1>
<div class="row">
    <div class="col-md-12">
        <div class="partidos-container">
            <c:forEach items="${partidosConResultado}" var="partido" varStatus="loop">
                <div class="partido-burbuja">
                    <div class="equipo-local">${partido.local}</div>
                    <div class="equipo-visitante">${partido.visitante}</div>
                    <div class="fecha">${partido.fecha}</div>
                    <div class="ganador">Ganador: ${partido.resultado.ganador}</div>
                </div>
            </c:forEach>
        </div>
    </div>
</div>
        <c:import url="componentesHTML/footer.jsp" /> 
</body>
</html>

