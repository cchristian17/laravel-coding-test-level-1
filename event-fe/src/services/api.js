import axios from "axios";
import Cookies from 'js-cookie';

const instance = axios.create({
  baseURL: 'http://localhost:8000/api/v1/',
  timeout: 3000,
  headers: {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
    'Authorization': 'Bearer ' + Cookies.get('access_token')
  }
});

export default instance
