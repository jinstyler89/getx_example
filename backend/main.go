package main

import (
	"encoding/json"
	"fmt"
	"io/ioutil"
	"net/http"
	"strconv"

	"github.com/gin-gonic/gin"

	"github.com/go-redis/redis/v8"
	"gorm.io/gorm"
)

type Product struct {
	gorm.Model
	Code  string
	Price uint
}

type User struct {
	gorm.Model
	Username string
	Password string
}

type Team struct {
	gorm.Model
	Name       string
	Thumnail   string
	OwnerRefer int
	Owner      User `gorm:"foreignKey:OwnerRefer"`
	Intro      string
}

type TeamUser struct {
	gorm.Model
	UserRefer int
	User      User `gorm:"foreignKey:UserRefer"`
	Status    int
}

type Project struct {
	gorm.Model
	OwnerRefer int
	Owner      User `gorm:"foreignKey:OwnerRefer"`
	Title      string
	Content    string
	Price      string
	StartTime  string
	EndTime    string
	HireCount  int
	Status     int
}

type ProjectUser struct {
	gorm.Model
	UserRefer int
	User      User `gorm:"foreignKey:UserRefer"`
	TeamRefer int
	Team      User `gorm:"foreignKey:TeamRefer"`
	Status    int
}

func main() {
	gin.SetMode(gin.DebugMode)
	r := gin.Default()

	rdb := redis.NewClient(&redis.Options{
		Addr:     "redis:6379",
		Password: "", // no password set
		DB:       0,  // use default DB
	})

	v1 := r.Group("/v1")
	{

		user := v1.Group("/user")
		{
			user.POST("/register", func(c *gin.Context) {
				c.JSON(http.StatusOK, gin.H{
					"okok": "laskdf",
				})
			})

			user.POST("/login", func(ctx *gin.Context) {
				ctx.JSON(http.StatusOK, gin.H{
					"okok": "laskdf",
				})
			})

			user.POST("/password/reset", func(ctx *gin.Context) {
				ctx.JSON(http.StatusOK, gin.H{
					"okok": "alskdf",
				})
			})
		}

		team := v1.Group("/team")
		{

			team.POST("/ok", func(ctx *gin.Context) {
				ctx.JSON(http.StatusOK, gin.H{
					"ok": "lk",
				})
			})
		}

		project := v1.Group("/project")
		{
			project.POST("/", func(ctx *gin.Context) {
				fmt.Println("body=>", ctx.Request.Body)

				body, err := ioutil.ReadAll(ctx.Request.Body)
				fmt.Println(string(body))
				if err != nil {
					// Handle error
				}

				var result map[string]any
				json.Unmarshal([]byte(body), &result)

				// The object stored in the "birds" key is also stored as
				// a map[string]any type, and its type is asserted from
				// the `any` type
				// jsonData := body.map

				primary_key, err := rdb.Get(ctx, "project:primary_key").Result()
				var final_id = 0
				if err == redis.Nil {
					fmt.Println("key2 does not exist")
				} else if err != nil {
					final_id = final_id + 1
					rdb.Set(ctx, "project:primary_key", final_id, 0)

					panic(err)
				} else {
					counter, err := strconv.ParseInt(primary_key, 10, 64)
					if err != nil {
						fmt.Print("conver error")
					}
					fmt.Println(counter)
					counter = counter + 1
					fmt.Println(counter)
					rdb.Set(ctx, "project:primary_key", counter, 0)
					fmt.Println("key2", primary_key)
					// final_id = int(counter)
				}

				for key, value := range result {
					// Each value is an `any` type, that is type asserted as a string
					fmt.Println(key, value.(string))
					key_data := fmt.Sprint("project:", primary_key, ":", key)
					fmt.Println(key_data)
					rdb.Set(ctx, key_data, value, 0).Err()
				}

				// err = rdb.Set(ctx, "id", jsonData, 0).Err()

				rdb.Set(ctx, "project:unique:name", "test", 0)
				// rdb.Set(ctx,"prject:")
				data := make(map[string]string)
				data["id"] = fmt.Sprint(primary_key)
				var data_arr []map[string]string
				data_arr = append(data_arr, data)
				ApiResponse(ctx, 0, "OK", "success", data_arr)
			})

			project.GET("/", func(ctx *gin.Context) {

				var data_arr []map[string]string

				primary_key, err := rdb.Get(ctx, "project:primary_key").Result()

				if err == redis.Nil {
					fmt.Println("key2 does not exist")
				} else if err != nil {
					panic(err)
				} else {
					counter, err := strconv.Atoi(primary_key)
					if err != nil {
						fmt.Print("conver error")
					}
					query := ctx.Request.URL.Query()

					for i := 0; i < counter; i++ {

						var hasData bool

						tempMap := map[string]string{}

						projectId := fmt.Sprint(i + 1)
						projectKey := "project:" + projectId
						fmt.Println("id=>", projectId)
						tempMap["id"] = projectId
						for key := range query {
							fmt.Println("key -> ", key)
							val, err := rdb.Get(ctx, projectKey+":"+key).Result()
							fmt.Println("err=>", err)
							fmt.Println("val=>", val)
							if err != redis.Nil {
								hasData = true
								fmt.Println("data is not null")
								tempMap[key] = val
							}
							// if err == redis.Nil {
							// 	fmt.Println("key2 does not exist")
							// } else if err != nil {
							// 	panic(err)
							// } else {
							// 	fmt.Println(val)
							// 	map1[key] = val
							// }
						}
						if hasData {
							data_arr = append(data_arr, tempMap)
						}
					}
					// final_id = int(counter)
				}

				ApiResponse(ctx, 0, "OK", "success", data_arr)

			})

			// get data detail

			project.GET("/:id", func(ctx *gin.Context) {
				var data_arr []map[string]string

				projectId := "project:" + ctx.Param("id")
				// val, err := rdb.Get(ctx, projectId).Result()
				// if err != nil {
				// 	panic(err)
				// }
				map1 := map[string]string{}

				map1["id"] = ctx.Param("id")

				query := ctx.Request.URL.Query()
				for key := range query {
					fmt.Println("key -> ", key)
					val, err := rdb.Get(ctx, projectId+":"+key).Result()
					if err == redis.Nil {
						fmt.Println("key2 does not exist")
					} else if err != nil {
						panic(err)
					} else {
						fmt.Println(val)
						map1[key] = val
					}
				}

				data_arr = append(data_arr, map1)

				jsonStr, err := json.Marshal(map1)
				if err != nil {
					fmt.Printf("Error: %s", err.Error())
				} else {
					fmt.Println(string(jsonStr))
				}
				// fmt.Println("key", val)
				ApiResponse(ctx, 0, "OK", "success", data_arr)

			})

			project.POST("/ok", func(ctx *gin.Context) {
				ctx.JSON(http.StatusOK, gin.H{
					"ok": "lk",
				})
			})
		}

		social := v1.Group("/social")
		{
			social.POST("/", func(ctx *gin.Context) {

				ctx.JSON(http.StatusOK, gin.H{
					"ok": "lk",
				})
			})
		}

	}

	r.GET("/ping", func(c *gin.Context) {
		c.JSON(http.StatusOK, gin.H{
			"message": "pong",
		})
	})

	r.NoRoute(func(c *gin.Context) {
		c.JSON(http.StatusNotFound, gin.H{
			"status": 0, "code": "NOT_FOUND", "message": "the api you request not found",
		})
	})
	r.Run(":3000") // listen and serve on 0.0.0.0:8080 (for windows "localhost:8080")
}

func ApiResponse(ctx *gin.Context, status int, code string, message string, data []map[string]string) {
	ctx.JSON(http.StatusOK, gin.H{
		"status": status, "code": code, "message": message, "data": data,
	})
}
