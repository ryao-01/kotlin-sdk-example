import com.antithesis.sdk.Assert.*
import com.antithesis.sdk.Random.*
import com.fasterxml.jackson.databind.ObjectMapper
import com.fasterxml.jackson.databind.node.ObjectNode


fun times10(x: Int): Int {
    val mapper = ObjectMapper()

    // Input value
    val inputDetails: ObjectNode = mapper.createObjectNode()
    inputDetails.put("input", x)
    sometimes(x % 2 == 1, "input is sometimes odd", inputDetails)

    // Calculated result
    val result = x * 10
    val resultDetails: ObjectNode = mapper.createObjectNode()
    resultDetails.put("result", result)
    always(result % 2 == 0, "result is always even", resultDetails)

    return result
}

fun main() {
    println("Hello, world!")
    for (i in 0 until 50) {
        val x = (getRandom() % 500L).toInt()
        println("$x x 10 = ${times10(x)}")
    }
}