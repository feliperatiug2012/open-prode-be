<?php

class UserEntity
{
    protected $id;
    protected $title;
    protected $alias;
    protected $username;
    protected $password;
    protected $approved;
    protected $deleted;

    /**
     * Accept an array of data matching properties of this class
     * and create the class
     *
     * @param array $data The data to use to create
     */
    public function __construct(array $data) {
        // no id if we're creating
        if(isset($data['id'])) {
            $this->id = $data['id'];

        }
        $this->title = $data['title'];
        $this->alias = $data['alias'];
        $this->username = $data['username'];
        $this->password = $data['password'];
        $this->approved = 0;
        $this->deleted = 0;
    }

    public function getId() {
        return $this->id;
    }

    public function getTitle() {
        return $this->title;
    }

    public function getAlias() {
        return $this->alias;
    }

    public function getUsername() {
        return $this->username;
    }

    public function getPassword() {
        return $this->password;
    }

    public function getApproved() {
        return $this->approved;
    }
    public function getDeleted() {
        return $this->deleted;
    }
}