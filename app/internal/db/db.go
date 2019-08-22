package db

import (
	sql "database/sql"
	"fmt"

	_ "github.com/lib/pq"
	log "github.com/sirupsen/logrus"
)

const (
	DB_HOST     = "localhost"
	DB_PORT     = 5432
	DB_USER     = "user"
	DB_PASSWORD = "password"
	DB_NAME     = "commodus"
)

func Connection() (*sql.DB, error) {
	dbinfo := fmt.Sprintf("host=%s port=%d user=%s password=%s dbname=%s sslmode=disable",
		DB_HOST, DB_PORT, DB_USER, DB_PASSWORD, DB_NAME)
	conn, err := sql.Open("postgres", dbinfo)

	if err != nil {
		log.Error("failed to connect to database")
		// retry?
		return nil, err
	}

	return conn, nil
}

func PagingClause(page int, count int) string {
	offset := page * count
	limit := count
	return fmt.Sprintf("OFFSET %d LIMIT %d", offset, limit)
}

// ActiveClause include active rows
func ActiveClause(active bool) string {
	var flag string
	if active {
		flag = "true"
	} else {
		flag = "false"
	}
	return fmt.Sprintf("active = %v", flag)
}
