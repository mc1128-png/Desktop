<template>
  <mm_warp>
    <mm_container class="container diy_view">
      <mm_row>
        <mm_col>
          <mm_view class="">
            <uni-forms :modelValue="form"  v-if="is_view()">
              <uni-forms-item v-if="$check_field('get','word') || $check_field('add','word') || $check_field('set','word')" label="单词" name="word">
                <uni-easyinput type="text" v-model="form['word']" v-if="user_group === '管理员' || (form['encyclopedia_of_words_id'] && $check_field('set','word')) || (!form['encyclopedia_of_words_id'] && $check_field('add','word'))" :disabled="disabledObj['word_isDisabled']" />
                <!-- 仅查看 -->
                <text v-else-if="$check_field('get','word')">
                  {{ form['word'] }}
                </text>
              </uni-forms-item>
              <uni-forms-item v-if="$check_field('get','interpretation') || $check_field('add','interpretation') || $check_field('set','interpretation')" label="释义" name="interpretation">
                <uni-easyinput type="text" v-model="form['interpretation']" v-if="user_group === '管理员' || (form['encyclopedia_of_words_id'] && $check_field('set','interpretation')) || (!form['encyclopedia_of_words_id'] && $check_field('add','interpretation'))" :disabled="disabledObj['interpretation_isDisabled']" />
                <!-- 仅查看 -->
                <text v-else-if="$check_field('get','interpretation')">
                  {{ form['interpretation'] }}
                </text>
              </uni-forms-item>
              <uni-forms-item v-if="$check_field('get','pronunciation') || $check_field('add','pronunciation') || $check_field('set','pronunciation')" label="读音" name="pronunciation">
                <!-- 修改权限 -->
                <view class="diy_field diy_img" v-if="form['pronunciation'] && $check_field('set','pronunciation')">
                  <view v-if="disabledObj['pronunciation_isDisabled']" class="btn_add_img">
                    <text>+</text>
                  </view>
                  <view v-if="!disabledObj['pronunciation_isDisabled']" class="btn_add_img" @click="change_file('pronunciation')">
                    <text>+</text>
                  </view>
                </view>
                <!-- 添加权限 -->
                <view class="diy_field diy_img" v-else-if="!form['pronunciation'] && $check_field('add','pronunciation')">
                  <view v-if="disabledObj['pronunciation_isDisabled']" class="btn_add_img">
                    <text>+</text>
                  </view>
                  <view v-if="!disabledObj['pronunciation_isDisabled']" class="btn_add_img" @click="change_file('pronunciation')">
                    <text>+</text>
                  </view>
                </view>
                <!-- 查询权限 -->
                <view class="diy_field diy_img" v-if="$check_field('get','pronunciation')">
                  <span>{{form['pronunciation']}}</span>
                </view>
                <!--&lt;!&ndash;{else if o.type === "视频"}&ndash;&gt;-->
                <!--<view class="diy_field diy_video">-->
                <!--<input type="file" id="form_video_pronunciation" title="pronunciation" @change="change_video($event.target.files,'pronunciation')" v-if="(form['pronunciation'] && $check_field('set','pronunciation')) || (!form['pronunciation'] && $check_field('add','pronunciation'))" />-->
                <!--<router-link :to="'/media/video?url=' + form['pronunciation']" v-else-if="$check_field('get','pronunciation')">查看视频</router-link>-->
                <!--</view>-->
                <!--&lt;!&ndash;{else if o.type === "音频"}&ndash;&gt;-->
                <!--<view class="diy_field diy_music">-->
                <!--<input type="file" id="form_music_pronunciation" title="pronunciation" @change="change_music($event.target.files,'pronunciation')" v-if="(form['pronunciation'] && $check_field('set','pronunciation')) || (!form['pronunciation'] && $check_field('add','pronunciation'))" />-->
                <!--<router-link :to="'/media/music?url=' + form['pronunciation']" v-else-if="$check_field('get','pronunciation')">聆听音频</router-link>-->
                <!--</view>-->
              </uni-forms-item>
              <uni-forms-item v-if="$check_field('get','picture') || $check_field('add','picture') || $check_field('set','picture')" label="图片" name="picture">
                <!-- 修改权限 -->
                <view class="diy_field diy_img" v-if="form['picture'] && $check_field('set','picture')">
                  <image v-if="disabledObj['picture_isDisabled']" :src="$fullUrl(form['picture'])" />
                  <image v-if="!disabledObj['picture_isDisabled']" :src="$fullUrl(form['picture'])" @click="change_img('picture')" />
                </view>
                <!-- 添加权限 -->
                <view class="diy_field diy_img" v-else-if="!form['picture'] && $check_field('add','picture')">
                  <view v-if="disabledObj['picture_isDisabled']" class="btn_add_img">
                    <text>+</text>
                  </view>
                  <view v-if="!disabledObj['picture_isDisabled']" class="btn_add_img" @click="change_img('picture')">
                    <text>+</text>
                  </view>
                </view>
                <!-- 查询权限 -->
                <view class="diy_field diy_img" v-else-if="$check_field('get','picture')">
                  <image :src="$fullUrl(form['picture'])" />
                </view>
              </uni-forms-item>
              <uni-forms-item v-if="$check_field('get','word_category') || $check_field('add','word_category') || $check_field('set','word_category')" label="单词类别" name="word_category">
                <select v-model="form.word_category" v-if="user_group === '管理员' || (form['encyclopedia_of_words_id'] && $check_field('set','word_category')) || (!form['encyclopedia_of_words_id'] && $check_field('add','word_category'))" class="query_select" :disabled="disabledObj['word_category_isDisabled']" >
                  <option class="query_option" v-for="o in list_word_category" :value="o['word_category']">{{o['word_category']}}</option>
                </select>
                <!-- 仅查看 -->
                <text v-else-if="$check_field('get','word_category')">
                  {{ form['word_category'] }}
                </text>
              </uni-forms-item>
              <uni-forms-item v-if="$check_field('get','memory_skills') || $check_field('add','memory_skills') || $check_field('set','memory_skills')" label="记忆技巧" name="memory_skills">
                <uni-easyinput type="textarea" v-model="form['memory_skills']" v-if="user_group === '管理员' || (form['encyclopedia_of_words_id'] && $check_field('set','memory_skills')) || (!form['encyclopedia_of_words_id'] && $check_field('add','memory_skills'))" :disabled="disabledObj['memory_skills_isDisabled']" />
                <!-- 仅查看 -->
                <text v-else-if="$check_field('get','memory_skills')">
                  {{ form['memory_skills'] }}
                </text>
              </uni-forms-item>

            </uni-forms>
            <view class="form_button">
              <button size="mini" type="primary" @click="submit()">提交</button>
              <button size="mini" @click="cancel()">取消</button>
            </view>
          </mm_view>
        </mm_col>
      </mm_row>
    </mm_container>
  </mm_warp>
</template>

<script>
import mixin from "@/mixins/page.js";

export default {
  mixins: [mixin],
  data() {
    return {
      field: "encyclopedia_of_words_id",
      url_add: "~/api/encyclopedia_of_words/add?",
      url_set: "~/api/encyclopedia_of_words/set?",
      url_get_obj: "~/api/encyclopedia_of_words/get_obj?",
      url_upload: "~/api/encyclopedia_of_words/upload?",

      query: {
        "encyclopedia_of_words_id": 0,
      },

      form: {
        "word":'', // 单词
        "interpretation":'', // 释义
        "pronunciation":'', // 读音
        "picture":'', // 图片
        "word_category":'', // 单词类别
        "memory_skills":'', // 记忆技巧
        "encyclopedia_of_words_id": 0, // ID
      },
      disabledObj:{
        "word_isDisabled": false,
        "interpretation_isDisabled": false,
        "pronunciation_isDisabled": false,
        "picture_isDisabled": false,
        "word_category_isDisabled": false,
        "memory_skills_isDisabled": false,
      },
      //单词类别选项列表
      list_word_category: [],
      }
  },
  methods: {
    changeLog(v,value){
      this.form[value] = v
    },
    /**
     * 上传文件
     * @param {Object} param文件参数
     */
    change_file(key_name){
      var _self = this;
      // 选择图像方法
      uni.chooseFile({
        count: 1,
        sizeType: ['original', 'compressed'], //可以指定是原图还是压缩图，默认二者都有
        sourceType: ['album'], //从相册选择
        success: function(res) {
          const tempFilePaths = res.tempFilePaths;
          const uploadTask = uni.uploadFile({
            url: _self.$fullUrl('/api/encyclopedia_of_words/upload?'),
            filePath: tempFilePaths[0],
            name: 'file',
            formData: {
              'i_want_to_customize': 'test'
            },
            header: {
              'x-auth-token': _self.$store.state.user.token
            },
            success: function(uploadFileRes) {
              var filename = JSON.parse(uploadFileRes.data).result.url
              _self.form[key_name] = filename
            }
          });

          uploadTask.onProgressUpdate(function(res) {
            _self.percent = res.progress;
            console.log('上传进度' + res.progress);
            console.log('已经上传的数据长度' + res.totalBytesSent);
            console.log('预期需要上传的数据总长度' + res.totalBytesExpectedToSend);
          });
        },
        error: function(e) {
          console.log(e);
        }
      });
    },
    /**
     * 上传图片
     * @param {Object} param文件参数
     */
    change_img(key_name){
      var _self = this;
      // 选择图像方法
      uni.chooseImage({
        count: 1,
        sizeType: ['original', 'compressed'], //可以指定是原图还是压缩图，默认二者都有
        sourceType: ['album'], //从相册选择
        success: function(res) {
          const tempFilePaths = res.tempFilePaths;
          const uploadTask = uni.uploadFile({
            url: _self.$fullUrl('/api/encyclopedia_of_words/upload?'),
            filePath: tempFilePaths[0],
            name: 'file',
            formData: {
              'i_want_to_customize': 'test'
            },
            header: {
              'x-auth-token': _self.$store.state.user.token
            },
            success: function(uploadFileRes) {
              var filename = JSON.parse(uploadFileRes.data).result.url
              _self.form[key_name] = filename
            }
          });

          uploadTask.onProgressUpdate(function(res) {
            _self.percent = res.progress;
            console.log('上传进度' + res.progress);
            console.log('已经上传的数据长度' + res.totalBytesSent);
            console.log('预期需要上传的数据总长度' + res.totalBytesExpectedToSend);
          });
        },
        error: function(e) {
          console.log(e);
        }
      });
    },
    /**
     * 获取对象后获取缓存表单
     * @param {Object} json
     * @param {Object} func
     */
    get_obj_before(param){
      var form = uni.db.get("form");
      if (form) {
        this.obj = uni.push(this.obj ,form);
        this.form = uni.push(this.form ,form);
      }
      var arr = []
      for (let key in form) {
        arr.push(key)
      }
      for (var i=0;i<arr.length;i++){
        this.disabledObj[arr[i] + '_isDisabled'] = true
      }
      uni.db.del("form");
      return param;
    },
    /**
     * 获取单词类别列表
     */
    async get_list_word_category() {
      var json = await this.$get("~/api/word_classification/get_list?");
      if(json.result && json.result.list){
        this.list_word_category = json.result.list;
      }
      else if(json.error){
        console.error(json.error);
      }
    },

    /**
     * 获取对象之后
     * @param {Object} json
     * @param {Object} func
     */
    get_obj_after(json, func){
    },

    is_view(){
      var bl = this.user_group == "管理员";

      if(!bl){
        bl = this.$check_action('/encyclopedia_of_words/table','add');
        console.log(bl ? "你有表格添加权限视作有添加权限" : "你没有表格添加权限");
      }
      if(!bl){
        bl = this.$check_action('/encyclopedia_of_words/table','set');
        console.log(bl ? "你有表格添加权限视作有修改权限" : "你没有表格修改权限");
      }
      if(!bl){
        bl = this.$check_action('/encyclopedia_of_words/view','add');
        console.log(bl ? "你有视图添加权限视作有添加权限" : "你没有视图添加权限");
      }
      if(!bl){
        bl = this.$check_action('/encyclopedia_of_words/view','set');
        console.log(bl ? "你有视图修改权限视作有修改权限" : "你没有视图修改权限");
      }
      if(!bl){
        bl = this.$check_action('/encyclopedia_of_words/view','get');
        console.log(bl ? "你有视图查询权限视作有查询权限" : "你没有视图查询权限");
      }

      console.log(bl ? "具有当前页面的查看权，请注意这不代表你有字段的查看权" : "无权查看当前页，请注意即便有字段查询权限没有页面查询权限也不行");

      return bl;
    },

  },
  created() {
    this.get_list_word_category();
  },
}
</script>

<style scoped>
.avatar-uploader .el-upload {
  border: 1px dashed #d9d9d9;
  border-radius: 6px;
  cursor: pointer;
  position: relative;
  overflow: hidden;
}

.avatar-uploader .el-upload:hover {
  border-color: #409EFF;
}

.form_button{
  padding-bottom: 15px;
  display: flex;
}
.form_button button{
  width: 40%;
}
.query_select{
  border-color: rgb(229, 229, 229);
  background-color: rgb(255, 255, 255);
  border-radius: 4px;
  box-sizing: border-box;
  flex: 1;
  width: 100%;
  line-height: 2;
  font-size: 14px;
  height: 2.4em;
  min-height: 2.4em;
  display: block;
  outline:none;
}

.query_option{
  width: 100%;
}

.btn_add_img{
  color: #D3D3D3;
  text-align: center;
  border: 1px solid #eee;
  height: 5rem;
  width: 5rem;
  position: relative;
}
.btn_add_img text{
  font-size: 35px;
  position: absolute;
  left: 50%;
  top: 50%;
  transform: translate(-50%,-50%);
}
</style>
