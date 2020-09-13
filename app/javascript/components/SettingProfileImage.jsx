import React from "react"

class SettingProfileImage extends React.Component {
  constructor(props) {
    super(props);
    this.state={
      userImage: this.props.userImage,
      userImageCurrent: this.props.userImage,
      userImageWarning: ''
    };
  }

  onClickSelectFile(){
    document.getElementById('setting-user-image').click();
  }


  onChangeImageFile(e){
    let createObjectURL = (window.URL || window.webkitURL).createObjectURL || window.createObjectURL;
    let files = e.target.files;
    if(files.length === 0){
      this.setState({userImage: this.state.userImageCurrent});
      this.setState({userImageWarning: ''});
    }else{
      let file = files[0];
      let fileNameRegExp = /\.(jpg|jpeg|png|gif|JPG|JPEG|PNG|GIF|)$/;
      let imageInput = document.getElementById('setting-user-image');
      if(!(file.type.match("image.*"))){
        this.setState({userImage: this.state.userImageCurrent});
        this.setState({userImageWarning: '画像ファイルをアップロードしてください'});
        imageInput.value = '';
      }else if(!(fileNameRegExp.test(file.name))){
        this.setState({userImage: this.state.userImageCurrent});
        this.setState({userImageWarning: 'gif、png、jpgのいずれかの画像ファイルをアップロードしてください'});
        imageInput.value = '';
      }else if(file.size > 1048576){
        this.setState({userImage: this.state.userImageCurrent});
        this.setState({userImageWarning: '1MB以内の画像ファイルをアップロードしてください'});
        imageInput.value = '';
      }else{
        this.setState({userImage: createObjectURL(files[0])});
        this.setState({userImageWarning: ''});
      }
    }
  }
  render () {
    let userImageWarning;

    if(this.state.userImageWarning){
      userImageWarning = (
          <div className={'user-warning'}>
            {this.state.userImageWarning}
          </div>
      )
    }

    return (
        <div className={'edit-user-image'}>
          <img src={this.state.userImage} alt={''}/>
          <button type={'button'} onClick={()=>{this.onClickSelectFile()}}>
            ファイルを選択
          </button>
          {userImageWarning}
          <input type={'file'} name={'image'} style={{display: 'none'}} id={'setting-user-image'} onChange={(e)=>{this.onChangeImageFile(e)}}/>
        </div>
    );
  }
}

export default SettingProfileImage;