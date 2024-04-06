package main

import (
	"encoding/json"
	"fmt"
	"log"
	"net/http"

	"github.com/gorilla/mux"
)

type Tasks struct {
	ID          string `json:"id"`
	TASKNAME    string `json:"TaskName"`
	TASKDETAILA string `json:"TaskDetails"`
	DATE        string `json:"date"`
}

var tasks []Tasks

func allTask() {
	task := Tasks{
		ID:          "1",
		TASKNAME:    "project new ",
		TASKDETAILA: "hey its my new project plz help meeeee",
		DATE:        "2024-04-04"}
	tasks = append(tasks, task)
	fmt.Println("your tasks are -", tasks)
}
func homePage(w http.ResponseWriter, r *http.Request) {
	fmt.Println("I am home page")
}
func getTasks(w http.ResponseWriter, r *http.Request) {
	w.Header().Set("Content-Type", "application/json")
	json.NewEncoder(w).Encode(tasks)
}
func getTask(w http.ResponseWriter, r *http.Request) {
	taskId := mux.Vars(r)
	flag := false
	for i := 0; i < len(tasks); i++ {
		if taskId["id"] == tasks[i].ID {
			json.NewEncoder(w).Encode(tasks[i])
			flag = true
			break
		}
	}
	if flag == false {
		json.NewEncoder(w).Encode(map[string]string{"status": "Error"})
	}
}
func createTask(w http.ResponseWriter, r *http.Request) {
	fmt.Println("I am home page")
}
func deleteTask(w http.ResponseWriter, r *http.Request) {
	fmt.Println("I am home page")
}
func updateTask(w http.ResponseWriter, r *http.Request) {
	fmt.Println("I am home page")
}
func handlerRoutes() {
	router := mux.NewRouter()
	router.HandleFunc("/", homePage).Methods("GET")
	router.HandleFunc("/gettasks", getTasks).Methods("GET")
	router.HandleFunc("/gettask/{id}", getTask).Methods("GET")
	router.HandleFunc("/createtask", createTask).Methods("PUT")
	router.HandleFunc("/delete/{id}", deleteTask).Methods("DELETE")
	router.HandleFunc("/update/{id}", updateTask).Methods("GET")
	log.Fatal(http.ListenAndServe(":8082", router))
}
func main() {
	allTask()
	handlerRoutes()

	fmt.Println("Hey riya i love you ")
}
