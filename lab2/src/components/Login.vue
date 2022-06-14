<!--2022/3/2 created by Yifan Yu-->
<template>
  <div class="login-box">
    <div class="lb-header">
      <a href="javascript:void(0)" :class="{ active: sIsActive }" id="student-login-box" @click="toggle">学生/教师</a>
      <a href="javascript:void(0)" :class="{ active: tIsActive }" id="teacher-login-box" @click="toggle">管理员</a>
    </div>
    <el-form
      class="student-login" v-show="showStudent"
      :model="loginForm"
      ref="loginFormRef"
      :rules="loginFormRules"
    >
      <el-form-item class="u-form-group" prop="number">
        <el-input
          type="text"
          v-model="loginForm.number"
          :maxlength="8"
          placeholder="Stu/Work No."
        />
      </el-form-item>
      <el-form-item class="u-form-group" prop="password">
        <el-input
          type="password"
          v-model="loginForm.password"
          placeholder="Password"
        />
      </el-form-item>
      <div class="u-form-group">
        <button type="submit" @click.prevent="login">登录</button>
        <p class="login-error">{{ msg }}</p>
      </div>
    </el-form>
    <el-form class="teacher-login" v-show="showTeacher" >
      <el-form-item class="u-form-group">
        <el-input type="text" v-model="loginForm.number"
                  :maxlength="5" placeholder="Admin Code"/> <!--00000-->
      </el-form-item>
      <el-form-item class="u-form-group">
        <el-input type="password" v-model="loginForm.password" placeholder="Password"/> <!--12345-->
      </el-form-item>
      <div class="u-form-group">
        <button type="submit" @click.prevent="adminLogin">登录</button>
        <p class="login-error">{{ msg }}</p>
      </div>
    </el-form>
  </div>
</template>

<script>
export default {
  name: 'Login',
  data () {
    return {
      // Default display
      showStudent: true,
      showTeacher: false,
      sIsActive: true,
      tIsActive: false,
      loginForm: {
        number: '',
        numError: '',
        password: '',
      },
      msg: '',
      loginFormRules: {
        number: [
          { required: true, message: '请输入工/学号', trigger: 'blur' }
        ],
        password: [
          { required: true, message: '请输入密码', trigger: 'blur' }
        ]
        },
      }
  },
  methods: {
    toggle: function() {
      console.log("toggle")
      this.showStudent = !this.showStudent
      this.showTeacher = !this.showTeacher
      this.sIsActive = !this.sIsActive
      this.tIsActive = !this.tIsActive
    },
    login () {
      console.log("Try to login as user...")
      var _this = this
      console.log(this.$store.state)
      this.$axios
        .post('/login', {
          number: this.loginForm.number,
          password: this.loginForm.password
        })
        .then(resp => {
          if (resp.data.code === 200 || resp.data.code === 201) {
            console.log(resp.data.code)
            _this.$store.commit('login', _this.loginForm)
            var path = this.$route.query.redirect
            console.log(resp.data.data.type)
            this.msg = resp.data.msg
            if (resp.data.data.type === 1) {
              _this.$store.commit('login', {
                user: {
                  number: this.loginForm.number,
                  role: 'student'
                }
              })
              if (resp.data.code === 201) {
                this.$router.replace({path: path === '/' || path === undefined ? '/student-home/change-password' : path})
              } else {
                this.$router.replace({path: path === '/' || path === undefined ? '/student-home/dashboard' : path})
              }
            } else {
              _this.$store.commit('login', {
                user: {
                  number: this.loginForm.number,
                  role: 'teacher'
                }
              })
              if (resp.data.code === 201) {
                this.$router.replace({path: path === '/' || path === undefined ? '/teacher-home/change-password' : path})
              } else {
                this.$router.replace({path: path === '/' || path === undefined ? '/teacher-home/dashboard' : path})
              }
            }
          } else {
            this.msg = resp.data.msg
          }
        })
        .catch(failResponse => {
        })
    },
    adminLogin () {
      console.log("Try to login as administrator...")
      var _this = this
      console.log(this.$store.state)
      this.$axios
        .post('/adminLogin', {
          adminNo: this.loginForm.number,
          adminPassword: this.loginForm.password
        })
        .then(successResponse => {
          if (successResponse.data.code === 200) {
            console.log("success")
            _this.$store.commit('adminLogin',  {
              user: {
                number: this.loginForm.number,
                role: 'admin'
              }
            })
            var path = this.$route.query.redirect
            this.$router.replace({path: path === '/' || path === undefined ? '/admin-home/dashboard' : path})
          }
          else {
            console.log("failed")
            this.msg = 'Access Denied'
            this.$message.error("无权限")
          }
        })
        .catch(failResponse => {
          console.log("Error happens")
        })
        // .then(successResponse => {
        //   if (successResponse.data.code === 200) {
        //     this.$router.replace({path: '/admin-home'})
        //   }
        //   else {
        //     this.msg = 'Access Denied'
        //   }
        // })
        // .catch(failResponse => {
        // })
    }
  }
}
</script>

<style scoped>
  @import '../assets/styles/login.css';
</style>
