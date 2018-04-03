<?php

class UserEntity
{
    protected $id;
    protected $title;
    protected $alias;
    protected $username;
    protected $password;
    protected $approved;
    protected $created;
    protected $modified;
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
            $this->title = $data['title'];
            $this->alias = $data['alias'];
            $this->username = $data['username'];
            $this->password = $data['username'] . "123";
            $this->approved = $data['approved'];
            $this->created = $data['created'];
            $this->modified = $data['modified'];
            $this->deleted = $data['deleted'];
        }

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

    public function getCreated() {
        return $this->created;
    }

    public function getModified() {
        return $this->modified;
    }

    public function getDeleted() {
        return $this->deleted;
    }
}