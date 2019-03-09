package main

import (
	"github.com/gin-gonic/gin"
)

func main() {

	r := gin.Default()

	r.GET("/status", Status)
	r.Run()
}

func Status(c *gin.Context) {
	c.JSON(200, gin.H{
		"status": "ok",
	})
}
