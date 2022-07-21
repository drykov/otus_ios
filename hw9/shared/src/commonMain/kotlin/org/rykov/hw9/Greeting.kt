package org.rykov.hw9

class Greeting {
    fun greeting(): String {
        return "Hello, ${Platform().platform}!"
    }
}