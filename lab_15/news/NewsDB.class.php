<?php require_once "INewsDB.class.php";

class NewsDB implements INewsDB {
    const DB_NAME = 'news.db';
    private $_db = null;

    function __get($name) {
        if ($name === 'db') {
            return $this->_db;
        }

        throw new Exception('Неверная база данных');
    }

    function __construct () {
        $this->_db = new PDO('sqlite:' . self::DB_NAME);
        if (filesize(self::DB_NAME) == 0) {
            $sql = "CREATE TABLE msgs (
                id INTEGER PRIMARY KEY AUTOINCREMENT,
                title TEXT,
                category INTEGER,
                description TEXT,
                source TEXT,
                datetime INTEGER
            )";
            $this->_db->query($sql) or die($this->_db->errorInfo());

            $sql = "CREATE TABLE category(
                id INTEGER,
                name TEXT
            )";
            $this->_db->query($sql) or die($this->_db->errorInfo());

            $sql = "INSERT INTO category (id, name)
                SELECT 1 as id, 'Политика' as name
                UNION SELECT 2 as id, 'Культура' as name
                UNION SELECT 3 as id, 'Спорт' as name";
            $this->_db->query($sql) or die($this->_db->errorInfo());
        }
    }

    function __destruct() {
        unset($_db);
    }

    function saveNews($title, $category, $description, $source) {
        $dt = time();
        $sql = "INSERT INTO msgs (
                    title,
                    category,
                    description,
                    source,
                    datetime
                ) VALUES (
                    :title,
                    :category,
                    :description,
                    :source,
                    :datetime
                )";
        $statement = $this->_db->prepare($sql);
        $statement->bindParam(':title', $title);
        $statement->bindParam(':category', $category);
        $statement->bindParam(':description', $description);
        $statement->bindParam(':source', $source);
        $statement->bindParam(':datetime', $dt);

        return $statement->execute();
    }

    function getNews(){
        $sql="SELECT msgs.id as id,
                   title,
                   category.name as category,
                   description,
                   source,
                   datetime
               FROM msgs, category
               WHERE category.id = msgs.category
               ORDER BY msgs.id DESC";

        return $this->_db->query($sql)->fetchAll(PDO::FETCH_ASSOC);
    }

    function showNews($id) {
        $sql = "SELECT
                    m.id,
                    m.title,
                    c.name AS category,
                    m.description,
                    m.source,
                    m.datetime
                FROM msgs AS m
                INNER JOIN category AS c ON m.category = c.id
                WHERE m.id = :id";
        $statement = $this->_db->prepare($sql);
        $statement->bindParam(':id', $id);

        if ($statement->execute()) {
            return $statement->fetch(PDO::FETCH_ASSOC);
        } else {
            return false;
        }
    }
}