<template>
	<view class="page_exam" id="exam_details">

		<mm_warp>
			<mm_container class="container">
				<mm_row>
					<mm_col>
						<mm_view class="details_view">
							<view v-if="!if_answered" class="countdown">
								距离考试结束还有：<span>{{minutes+":"+seconds}}</span>
							</view>
							<view>
								<view v-if="if_answered" class="col-24 col-lg-24 col-md-24">
									<view class="title_margin" style="margin-bottom: 20px" v-if="score_state===0">未评分</view>
									<view class="title_margin" style="margin-bottom: 20px" v-else>已评分，得分：<span style="color: red">{{answer_form.score}}</span></view>
								</view>
							</view>
							<view v-for="(o,i) in question_list">
								<view class="title_margin" v-if="o.type === '单选题'">
									{{o.question_order+'.单选题：'+o.title+"   ("+o.score+"分)"}}
									<span v-if="if_answered" class="score_show">--------{{answer_scores[i]}}分</span>
								</view>
								<view class="title_margin" v-else-if="o.type === '多选题'">
									{{o.question_order+'.多选题：'+o.title+"   ("+o.score+"分)"}}
									<span v-if="if_answered" class="score_show">--------{{answer_scores[i]}}分</span>
								</view>
								<view class="title_margin" v-else-if="o.type === '判断题'">
									{{o.question_order+'.判断题：'+o.title+"   ("+o.score+"分)"}}
									<span v-if="if_answered" class="score_show">--------{{answer_scores[i]}}分</span>
								</view>
								<view class="title_margin" v-else-if="o.type === '填空题'">
									{{o.question_order+'.填空题：'+o.title+"   ("+o.score+"分)"}}
									<span v-if="if_answered" class="score_show">
										<span v-if="score_state===0">--------未评分</span>
										<span v-else>--------{{answer_scores[i]}}分</span>
									</span>
								</view>
								<view class="title_margin" v-else>
									{{o.question_order+'.主观题：'+o.title+"   ("+o.score+"分)"}}
									<span v-if="if_answered" class="score_show">
										<span v-if="score_state===0">--------未评分</span>
										<span v-else>--------{{answer_scores[i]}}分</span>
									</span>
								</view>
								<view v-if="o.type === '单选题'">
									<view class="uni-list">
										<radio-group v-model="answers[i]" @change="set_radio($event,i)">
											<label style="margin-right: 20px;" class="uni-list-cell uni-list-cell-pd" v-for="q in get_question_list(o.question_item)">
												<radio :disabled="if_answered" :value="q" :checked="answers[i]==q" />{{q}}
											</label>
										</radio-group>
									</view>
									<view class="score_show" v-if="if_answered && reference_answers[i]">
										参考答案：{{reference_answers[i]}}
									</view>
								</view>
								<view v-else-if="o.type === '多选题'">
									<view class="uni-list">
										<checkbox-group v-model="answers[i]" @change="set_checkbox($event,i)">
											<label style="margin-right: 20px;" class="uni-list-cell uni-list-cell-pd" v-for="q in get_question_list(o.question_item)">
												<checkbox :disabled="if_answered" :value="q" :checked="check_checkbox(answers[i],q)" />{{q}}
											</label>
										</checkbox-group>
									</view>
									<view class="score_show" v-if="if_answered && reference_answers[i]">
										参考答案：{{reference_answers[i]}}
									</view>
								</view>
								<view v-if="o.type === '判断题'">
									<view class="uni-list">
										<radio-group v-model="answers[i]" @change="set_radio($event,i)">
											<label style="margin-right: 20px;" class="uni-list-cell uni-list-cell-pd" v-for="q in get_question_list(o.question_item)">
												<radio :disabled="if_answered" :value="q" :checked="answers[i]==q" />{{q}}
											</label>
										</radio-group>
									</view>
									<view class="score_show" v-if="if_answered && reference_answers[i]">
										参考答案：{{reference_answers[i]}}
									</view>
								</view>
								<view v-else-if="o.type === '填空题'">
									<input type="text" :disabled="if_answered" class="answer_input" v-model="answers[i]" />
									<div class="score_show" v-if="if_answered">
										参考答案：{{reference_answers[i]}}
									</div>
								</view>
								<view v-else-if="o.type === '主观题'">
									<textarea  class="answer_textarea" :disabled="if_answered" v-model="answers[i]"></textarea>
									<div class="score_show" v-if="if_answered">
										参考答案：{{reference_answers[i]}}
									</div>
								</view>
							</view>
							<view class="title_margin">
								<view class="answer_submit_user_str">
									<span>提交人：</span>
									<input type="text" :disabled="true" v-model="submit_user_str" />
								</view>
							</view>
							<view class="answer_submit_button">
								<view class="col-12">
									<view class="answer_btn_box">
										<button v-if="!if_answered" class="answer_btn_submit" @click="submit()">提交</button>
										<button class="answer_btn_cancel" @click="cancel()">取消</button>
										<view class="clear">
										</view>
									</view>
								</view>
							</view>
						</mm_view>
					</mm_col>
				</mm_row>
			</mm_container>
		</mm_warp>
	</view>
</template>

<script>
	import mixin from "@/mixins/page.js";

	export default {
		mixins: [mixin],
		components: {
		},
		data() {
			return {
				field: "exam_id",
				url_add: "~/api/user_answer/add?",
				url_set: "~/api/user_answer/set?",
				url_get_obj: "~/api/exam/get_obj?",
				url_upload: "~/api/user_answer/upload?",

				query: {
					exam_id: 0,
				},

				form: {
					exam_id: 0,
					name: "",
					duration: 0,
					score: 0,
					status: "启用"
				},
				url_get_question_list: "~/api/exam_question/get_list?",
				question_list:[],
				answers:[],
				submit_user_str:"",
				answer_form:{
					user_answer_id:0,
					user_id:0,
					exam_id:0,
					score:0,
					score_state:0,
					answers:[],
					score_detail:[],
					objective_score:0,
					subjective_score:0,
					nickname:""
				},
				if_answered:false,
				maxtime:0,
				minutes:0,
				seconds:0,
				timer:"",
				score_state:0,
				answer_scores:[],
				reference_answers:[]
			}
		},
		methods: {
			async get_obj_after(){
				let userJson = await this.$get("~/api/user/get_obj?user_id="+this.$store.state.user.user_id);
				if(userJson.result){
					this.submit_user_str = userJson.result.obj.username+"-"+userJson.result.obj.nickname;
					this.answer_form.user_id = userJson.result.obj.user_id;
					this.answer_form.nickname = userJson.result.obj.nickname;
				}else if(userJson.error){
					console.error(userJson.error);
				}
				let json = await this.$get(this.url_get_question_list+"exam_id="+this.query.exam_id+"&orderby=question_order");
				if(json.result){
					this.question_list = json.result.list;
					for (let i=0;i<this.question_list.length;i++){
						if (this.question_list[i].type==='多选题'){
							this.answers[i]=[];
						}else{
							this.answers[i]="";
						}
					}
				}else if(json.error){
					console.error(json.error);
				}
				let answerJson = await this.$get("~/api/user_answer/get_obj?user_id="+this.answer_form.user_id+"&exam_id="+this.query.exam_id);
				if(answerJson.result && answerJson.result.obj != null){
					this.answer_form = answerJson.result.obj;
					this.score_state = answerJson.result.obj.score_state
					this.answer_form.answers = JSON.parse(this.answer_form.answers);
					this.answer_form.score_detail = JSON.parse(this.answer_form.score_detail);
					for(let i=0;i<this.answer_form.answers.length;i++){
						this.answers[i] = this.answer_form.answers[i].answer;
						this.answer_scores[i] = this.answer_form.score_detail[i].score;
						if (this.question_list[i].type==='单选题' || this.question_list[i].type==='判断题' || this.question_list[i].type==='多选题') {

							if (this.answer_scores[i]!==this.question_list[i].score){
								this.reference_answers[i]=this.question_list[i].answer;
							}
						}else{
							this.reference_answers[i]=this.question_list[i].answer;
						}
					}
					this.if_answered = true
				}else if(answerJson.error){
					console.error(answerJson.error);
				}
				if (!this.if_answered){
					this.maxtime = this.form.duration*60;
					this.timer = window.setInterval(() => {
						setTimeout(this.set_countdown(), 0)
					}, 1000)
				}
			},
			get_question_list(question_str){
				let question_list = question_str.split("\n");
				return question_list;
			},
			submit_main(){
				let _this = this;
				_this.answer_form.exam_id = _this.query.exam_id;
				for (let i=0;i<_this.answers.length;i++){
					let obj = {"exam_question_id":_this.question_list[i].exam_question_id,"answer":_this.answers[i]};
					_this.answer_form.answers[i] = obj;
					if (_this.question_list[i].type==='单选题' || _this.question_list[i].type==='判断题') {
						if (_this.answers[i]===_this.question_list[i].answer){
							let obj = {"exam_question_id":_this.question_list[i].exam_question_id,"score":_this.question_list[i].score};
							_this.answer_form.score_detail[i] = obj;
							_this.answer_form.objective_score = _this.answer_form.objective_score + _this.question_list[i].score;
						}else {
							let obj = {"exam_question_id":_this.question_list[i].exam_question_id,"score":0};
							_this.answer_form.score_detail[i] = obj;
						}
					}else if (_this.question_list[i].type==='多选题'){
						let flag = true;
						let question_answer_list = _this.question_list[i].answer.split("|")
						if (_this.answers[i].length!==question_answer_list.length){
							flag = false;
						}else {
							for (let j=0;j<question_answer_list.length;j++){
								if (_this.answers[i].indexOf(question_answer_list[j])===-1){
									flag = false;
									break;
								}
							}
						}
						if (flag){
							let obj = {"exam_question_id":_this.question_list[i].exam_question_id,"score":_this.question_list[i].score};
							_this.answer_form.score_detail[i] = obj;
							_this.answer_form.objective_score = _this.answer_form.objective_score + _this.question_list[i].score;
						}else {
							let obj = {"exam_question_id":_this.question_list[i].exam_question_id,"score":0};
							_this.answer_form.score_detail[i] = obj;
						}
					}else{
						let obj = {"exam_question_id":_this.question_list[i].exam_question_id,"score":0};
						_this.answer_form.score_detail[i] = obj;
					}
				}
				_this.answer_form.answers = JSON.stringify(_this.answer_form.answers);
				_this.answer_form.score_detail = JSON.stringify(_this.answer_form.score_detail);
				_this.answer_form.score = _this.answer_form.subjective_score+_this.answer_form.objective_score;
				let url = _this.url_add;
				this.$post(url, _this.answer_form, function(json, status) {
					console.log("提交结果：" ,json);
					if (json.result) {
						_this.events("submit_after", json, null);
					} else if (json.error) {
						_this.$toast(json.error.message, 'danger');
					}
				});
			},
			set_countdown(){
				if (this.maxtime >= 0) {
					this.minutes = Math.floor(this.maxtime / 60);
					this.seconds = Math.floor(this.maxtime % 60);
					--this.maxtime;
				} else{
					clearInterval(this.timer);
					alert("时间到，结束!");
				}
			},
			check_checkbox(answer_list,choice){
				for(let i=0;i<answer_list.length;i++){
					if (answer_list[i]===choice){
						return true;
					}
				}
				return false
			},
			set_radio(e,answer_index){
				this.answers[answer_index]=e.detail.value;
			},
			set_checkbox(e,answer_index){
				this.answers[answer_index]=e.detail.value;
			}
		},
		onLoad() {
		}
	}
</script>

<style>
	.clear{
		left: 0;
		right: 0;
		padding: 0;
		margin: 0;
		clear: both;
	}
	.answer_input{
		width: 80%;
		border: 1px solid #666666;
		border-radius: 5px;
		line-height: 30px;
		height: 30px;
	}
	.answer_textarea{
		width: 80%;
		border: 1px solid #666666;
		border-radius: 5px;
		line-height: 30px;
		height: 90px;
	}
	.title_margin{
		width: 1000px;
		margin-top: 20px;
	}
	.countdown{
		padding-top: 20px;
	}
	.countdown span{
		color: red;
	}
	.score_show{
		color: red;
	}
	.answer_submit_user_str{
		display: flex;
	}
	.answer_submit_button{
		margin-top: 30px;
		padding-bottom: 30px;
	}
	.answer_submit_button button{
		width: 100px;
		line-height: 40px;
		border-radius: 5px;
	}
	.answer_btn_submit{
		background-color: blue;
		margin-right: 20px;
		color: white;
	}
	.answer_btn_box button{
		float: left;
	}
</style>
